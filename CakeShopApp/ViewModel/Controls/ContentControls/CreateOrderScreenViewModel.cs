using CakeShopApp.Utils;
using CakeShopApp.View.Controls.Dialogs;
using CakeShopApp.ViewModel.Controls.Dialogs;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CakeShopApp.ViewModel.Controls.ContentControls
{
    public class CreateOrderScreenViewModel : BaseViewModel
    {
        private static CreateOrderScreenViewModel _instance;

        public static CreateOrderScreenViewModel Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new CreateOrderScreenViewModel();
                }
                return _instance;
            }
        }

        private CreateOrderScreenViewModel()
        {
            ORDER = new CAKESTOREEntities().ORDERS.FirstOrDefault(item => item.ORDERS_ID == 3);
        }

        private CAKE_IN_ORDERS _selectedItem;

        public ORDER ORDER { get; set; }

        private DeleteCakeOfCakeInOrderViewModel _deleteCakeOfCakeInOrderViewModel;

        internal void caculateTotalPrice()
        {
            double totalPrice = 0;
            foreach (var item in ORDER.CAKE_IN_ORDERS)
            {
                totalPrice = (double)(totalPrice + item.CAKE.PRICE * item.NUMBER);
            }
            ORDER.TOTAL_PRICE = totalPrice;
        }

        public ICommand RunDeleteCakeOfCakeInOrder => new AnotherCommandImplementation(ExecuteDeleteCakeOfCakeInOrderAsync);

        private void ExtendedOpenedEventHandler(object sender, DialogOpenedEventArgs eventargs)
            => Console.WriteLine("You could intercept the open and affect the dialog using eventArgs.Session.");

        private async void ExecuteDeleteCakeOfCakeInOrderAsync(object obj)
        {
            CAKE_IN_ORDERS selectedItem = obj as CAKE_IN_ORDERS;
            _selectedItem = selectedItem;
            this._deleteCakeOfCakeInOrderViewModel = new DeleteCakeOfCakeInOrderViewModel()
            {
                cakeInOrder = selectedItem
            };

            var view = new DeleteCakeOfCakeInOrderDialogControl
            {
                DataContext = this._deleteCakeOfCakeInOrderViewModel
            };

            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, DeleteCakeOfCakeInOrderClosingHandler);

            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));

        }

        private void DeleteCakeOfCakeInOrderClosingHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
               parameter == false) return;

            using (var db = new CAKESTOREEntities())
            {
                //tính lại tổng giá
                var resultPrice = ORDER.TOTAL_PRICE;
                resultPrice = resultPrice - _selectedItem.CAKE.PRICE * _selectedItem.NUMBER;
                ORDER.TOTAL_PRICE = resultPrice;

                //tính lại số bánh còn lại trong kho
                var cake = db.CAKEs.FirstOrDefault(item => item.CAKE_ID == _selectedItem.CAKE_ID);
                var remaining_amount = cake.REMAINING_AMOUNT;
                remaining_amount = (int)(remaining_amount + _selectedItem.NUMBER);

                ORDER.CAKE_IN_ORDERS.Remove(_selectedItem);
            };
        }
    }
}