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

        private CAKE_IN_ORDERS _selectedItem;

        public ORDER ORDER { get; set; }

        private DeleteCakeOfCakeInOrderViewModel _deleteCakeOfCakeInOrderViewModel;

        private CreateOrderScreenViewModel() {
            ORDER = new ORDER();
            ORDER.TOTAL_PRICE = 0;
            ORDER.DATE_CREATE = DateTime.Now;
        }

        internal void caculateTotalPrice()
        {
            double totalPrice = 0;
            foreach (var item in ORDER.CAKE_IN_ORDERS)
            {
                totalPrice = (double)(totalPrice + item.CAKE.PRICE * item.NUMBER);
            }
            ORDER.TOTAL_PRICE = totalPrice;
        }

        public List<CAKE_IN_ORDERS> GetAllCakeInOrderNow()
        {
            return ORDER.CAKE_IN_ORDERS.ToList();
        }

        public void AddCakeToOrder(CAKE_IN_ORDERS cakeInOrder)
        {
            var cake = ORDER.CAKE_IN_ORDERS.FirstOrDefault(item => item.CAKE_ID == cakeInOrder.CAKE_ID);
            if(cake == null)
            {
                ORDER.CAKE_IN_ORDERS.Add(cakeInOrder);
                ORDER.TOTAL_PRICE = ORDER.TOTAL_PRICE + cakeInOrder.NUMBER * cakeInOrder.CAKE.PRICE;
            }
            else
            {
                caculateTotalPrice();
            }
        }

        public ICommand RunDeleteCakeOfCakeInOrder => new AnotherCommandImplementation(ExecuteDeleteCakeOfCakeInOrderAsync);
        public ICommand RunAddOrder => new AnotherCommandImplementation(ExecuteAddOrderAsync);

        private void UpdateCakeAmount(int cakeid , int number)
        {
            
            using(var db = new CAKESTOREEntities())
            {
                var cake = db.CAKEs.FirstOrDefault(item => item.CAKE_ID == cakeid);
                cake.REMAINING_AMOUNT = cake.REMAINING_AMOUNT - number; ;
                db.SaveChanges();
            }
        }

        private async void ExecuteAddOrderAsync(object obj)
        {
            ORDER.CAKE_IN_ORDERS.ToList().ForEach(x => {
                UpdateCakeAmount(x.CAKE_ID, (int)x.NUMBER);
                HomeScreenViewModel.Instance.updateCakeAmount(x.CAKE_ID, x.CAKE.CAKE_TYPE, (int)x.NUMBER);
                x.CAKE = null;
            }); //TODO !!!!

            using (var db = new CAKESTOREEntities())
            {
                db.ORDERS.Add(ORDER);
                db.SaveChanges();
            };
            var SuccessMessage = new SampleMessageDialogViewModel { Message = "Hóa đơn hoàn tất" };
            var view = new SampleMessageDialog { DataContext = SuccessMessage };
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, SuccessMessageDialogClosingHandler);
            ORDER = new ORDER();
            ORDER.TOTAL_PRICE = 0;
            ORDER.DATE_CREATE = DateTime.Now;
        }

        private void SuccessMessageDialogClosingHandler(object sender, DialogClosingEventArgs eventArgs)
        {
        }

        private void ExtendedOpenedEventHandler(object sender, DialogOpenedEventArgs eventargs)
            => Console.WriteLine("You could intercept the open and affect the dialog using eventArgs.Session.");

        private async void ExecuteDeleteCakeOfCakeInOrderAsync(object obj)
        {
            CAKE_IN_ORDERS selectedItem = obj as CAKE_IN_ORDERS;
            _selectedItem = selectedItem;
            this._deleteCakeOfCakeInOrderViewModel = new DeleteCakeOfCakeInOrderViewModel()
            {
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

            //tính lại tổng giá
            var resultPrice = ORDER.TOTAL_PRICE;
            resultPrice = resultPrice - _selectedItem.CAKE.PRICE * _selectedItem.NUMBER;
            ORDER.TOTAL_PRICE = resultPrice;

            using (var db = new CAKESTOREEntities())
            {
                //tính lại số bánh còn lại trong kho
                var cake = db.CAKEs.FirstOrDefault(item => item.CAKE_ID == _selectedItem.CAKE_ID);
                var remaining_amount = cake.REMAINING_AMOUNT;
                remaining_amount = (int)(remaining_amount + _selectedItem.NUMBER);
            };
            ORDER.CAKE_IN_ORDERS.Remove(_selectedItem);
        }
    }
}