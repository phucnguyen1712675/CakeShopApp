using CakeShopApp.Utils;
using CakeShopApp.View;
using CakeShopApp.View.Controls.ContentControls.Dialogs;
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
    public class DetailViewModel : BaseViewModel
    {
        private DetailDialogViewModel _detailDialogViewModel;

        private CategoryDialogViewModel _categoryDialogViewModel;
        private ICommand _backHomeCommand { get; set; }
        public ICommand BackHomeCommand => _backHomeCommand ?? (_backHomeCommand = new CommandHandler((param) => BackHomeAction(), () => CanExecute));
        public ICommand RunAddCateCommand => new AnotherCommandImplementation(ExecuteAddCateDialog);
        public ICommand RunAddCakeCommand => new AnotherCommandImplementation(ExecuteAddCakeDialog);
        public ICommand RunEditCakeCommand => new AnotherCommandImplementation(ExecuteEditCakeDialog);
        public CAKE SelectedCake { get; set; }

        public bool CanExecute => true;

        private void ExtendedOpenedEventHandler(object sender, DialogOpenedEventArgs eventargs)
            => Console.WriteLine("You could intercept the open and affect the dialog using eventArgs.Session.");

        private void BackHomeAction() => MainWindow.Instance.SetContentControl(new HomeScreenViewModel());

        private async void ExecuteAddCateDialog(object obj)
        {
            this._categoryDialogViewModel = new CategoryDialogViewModel()
            {
                SelectedCakeType = new CAKE_TYPE()
            };

            var view = new CategoryDialogControl
            {
                DataContext = this._categoryDialogViewModel
            };

            //show the dialog
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, AddCateDialogClosingEventHandler);

            //check the result...
            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));
        }

        private async void ExecuteAddCakeDialog(object obj)
        {
            this._detailDialogViewModel = new DetailDialogViewModel()
            {
                SelectedCake = new CAKE()
            };

            var view = new DetailDialogControl
            {
                DataContext = this._detailDialogViewModel
            };

            //show the dialog
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, AddCakeDialogClosingEventHandler);

            //check the result...
            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));
        }

        private async void ExecuteEditCakeDialog(object obj)
        {
            this._detailDialogViewModel = new DetailDialogViewModel()
            {
                SelectedCake = this.SelectedCake
            };

            var view = new DetailDialogControl
            {
                DataContext = this._detailDialogViewModel
            };

            //show the dialog
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, EditCakeDialogClosingEventHandler);

            //check the result...
            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));
        }

        private void AddCateDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            using (var db = new CAKESTOREEntities())
            {
                var newCate = this._categoryDialogViewModel.SelectedCakeType;
                db.CAKE_TYPE.Add(newCate);
                db.SaveChanges();
            };
        }

        private void AddCakeDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            using (var db = new CAKESTOREEntities())
            {
                var newCake = this._detailDialogViewModel.SelectedCake;
                db.CAKEs.Add(newCake);
                db.SaveChanges();
            };
        }

        private void EditCakeDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter && parameter == false)
            {
                using (var db = new CAKESTOREEntities())
                {
                    var cake = db.CAKEs.Find(this.SelectedCake.CAKE_ID);
                    db.Entry(cake).Reload();
                };
            }
            else
            {
                using (var db = new CAKESTOREEntities())
                {
                    var cake = db.CAKEs.Find(this.SelectedCake.CAKE_ID);
                    var modifiedCake = this._detailDialogViewModel.SelectedCake;
                    //cake.CAKE_ID = newCake.CAKE_ID;
                    cake.CAKE_NAME = modifiedCake.CAKE_NAME;
                    cake.CAKE_TYPE = this._detailDialogViewModel.CakeCategories[this._detailDialogViewModel.SelectedIndex].TYPE_ID;
                    cake.PRICE = modifiedCake.PRICE;
                    cake.IMAGE = modifiedCake.IMAGE;
                    cake.REMAINING_AMOUNT = modifiedCake.REMAINING_AMOUNT;
                    db.SaveChanges();
                };
            }
        }
    }
}
