using CakeShopApp.Utils;
using CakeShopApp.View;
using CakeShopApp.View.Controls.ContentControls.Dialogs;
using CakeShopApp.View.Controls.Dialogs;
using CakeShopApp.ViewModel.Controls.Dialogs;
using DrWPF.Windows.Data;
using Force.DeepCloner;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace CakeShopApp.ViewModel.Controls.ContentControls
{
    public class HomeScreenViewModel : BaseViewModel
    {
        private DetailDialogViewModel _detailDialogViewModel;

        private CategoryDialogViewModel _categoryDialogViewModel;
        public ObservableDictionary<CAKE_TYPE, ObservableCollection<CAKE>> CakeCategories { get; set; }
        public int SelectedIndex { get; set; }
        private ICommand _editCategoryCommand { get; set; }
        public ICommand EditCategoryCommand => _editCategoryCommand ?? (_editCategoryCommand = new CommandHandler((param) => SelectedCategoryAction(param), () => CanExecute));
        private ICommand _selectedCakeCommand { get; set; }
        public ICommand SelectedCakeCommand => _selectedCakeCommand ?? (_selectedCakeCommand = new CommandHandler((param) => SelectedCakeAction(param), () => CanExecute));
        public ICommand RunAddCateCommand => new AnotherCommandImplementation(ExecuteAddCateDialog);
        public ICommand RunAddCakeCommand => new AnotherCommandImplementation(ExecuteAddCakeDialog);

        public HomeScreenViewModel()
        {
            GetCakeCategories(0);
        }

        private void GetCakeCategories(int selectedIndex)
        {
            CakeCategories = new ObservableDictionary<CAKE_TYPE, ObservableCollection<CAKE>>();

            using (var db = new CAKESTOREEntities())
            {
                db.CAKE_TYPE.ToList().ForEach(cat =>
                {
                    var cakeByCateIdList = db.CAKEs.Where(cake => cake.CAKE_TYPE == cat.TYPE_ID).ToList();
                    CakeCategories.Add(cat, new ObservableCollection<CAKE>(cakeByCateIdList));
                });
            };

            this.SelectedIndex = selectedIndex;
        }

        public bool CanExecute => true;

        #region Dialogs

        private void ExtendedOpenedEventHandler(object sender, DialogOpenedEventArgs eventargs)
            => Console.WriteLine("You could intercept the open and affect the dialog using eventArgs.Session.");

        private async void SelectedCategoryAction(object param)
        {
            if (param == null)
            {
                return;
            }
            var cate = param as CAKE_TYPE;
            var clonedCate = cate.ShallowClone();

            this._categoryDialogViewModel = new CategoryDialogViewModel()
            {
                SelectedCakeType = clonedCate,
                Status = "Edit cake type"
            };

            var view = new CategoryDialogControl
            {
                DataContext = this._categoryDialogViewModel
            };

            //show the dialog
            var result = await DialogHost.Show(view, MainWindowViewModel.Instance.Identifier, ExtendedOpenedEventHandler, EditCateDialogClosingEventHandler);

            //check the result...
            Console.WriteLine("Dialog was closed, the CommandParameter used to close it was: " + (result ?? "NULL"));
        }

        private void SelectedCakeAction(object param)
        {
            if (param == null)
            {
                return;
            }
            var cake = param as CAKE;
            //var clonedCake = cake.DeepClone();

            var detailVm = new DetailViewModel
            {
                SelectedCake = cake
            };
            MainWindow.Instance.SetContentControl(detailVm);
        }

        private async void ExecuteAddCateDialog(object obj)
        {
            this._categoryDialogViewModel = new CategoryDialogViewModel()
            {
                SelectedCakeType = new CAKE_TYPE(),
                Status = "Add cake type"
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

        private void AddCateDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            var tempIndex = this.SelectedIndex;

            using (var db = new CAKESTOREEntities())
            {
                var newCate = this._categoryDialogViewModel.SelectedCakeType;
                db.CAKE_TYPE.Add(newCate);
                db.SaveChanges();
            };

            GetCakeCategories(tempIndex);
        }

        private void AddCakeDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            var tempIndex = this.SelectedIndex;

            using (var db = new CAKESTOREEntities())
            {
                var newCake = this._detailDialogViewModel.SelectedCake;
                newCake.CAKE_TYPE = this._detailDialogViewModel.CakeCategories[this._detailDialogViewModel.SelectedIndex].TYPE_ID;
                db.CAKEs.Add(newCake);
                db.SaveChanges();
            };

            GetCakeCategories(tempIndex);
        }

        private void EditCateDialogClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if (eventArgs.Parameter is bool parameter &&
                parameter == false) return;

            var tempIndex = this.SelectedIndex;

            using (var db = new CAKESTOREEntities())
            {
                var modifiedCate = this._categoryDialogViewModel.SelectedCakeType;
                var cate = db.CAKE_TYPE.Find(modifiedCate.TYPE_ID);
                var cateFromDic = CakeCategories.FirstOrDefault(c => c.Key.TYPE_ID == cate.TYPE_ID).Key;

                var tryUpdateKey = DictionaryHelper.UpdateKey(CakeCategories, cateFromDic, modifiedCate);

                if (tryUpdateKey)
                {
                    cate.TYPE_NAME = modifiedCate.TYPE_NAME;
                    db.SaveChanges();

                    GetCakeCategories(tempIndex);
                }
                else
                {
                    MessageBox.Show("Error");
                }
            };
        }

        #endregion
    }
}
