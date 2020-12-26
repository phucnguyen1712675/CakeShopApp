using CakeShopApp.Utils;
using CakeShopApp.View;
using MaterialDesignExtensions.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
namespace CakeShopApp.ViewModel.Controls.ContentControls
{
    public class HomeScreenViewModel : BaseViewModel
    {
        public Dictionary<CAKE_TYPE, ObservableCollection<CAKE>> CakeCategories { get; set; }
        public int SelectedIndex { get; set; }
        private ICommand _selectedCategoryCommand { get; set; }
        public ICommand SelectedCategoryCommand => _selectedCategoryCommand ?? (_selectedCategoryCommand = new CommandHandler((param) => SelectedCategoryAction(param), () => CanExecute));
        private ICommand _selectedCakeCommand { get; set; }
        public ICommand SelectedCakeCommand => _selectedCakeCommand ?? (_selectedCakeCommand = new CommandHandler((param) => SelectedCakeAction(param), () => CanExecute));
        public ICommand RunAddCateCommand => new AnotherCommandImplementation(ExecuteAddCateDialog);
        public ICommand RunAddCakeCommand => new AnotherCommandImplementation(ExecuteAddCakeDialog);

         

        public HomeScreenViewModel()
        {
            this.SelectedIndex = 0;

            CakeCategories = new Dictionary<CAKE_TYPE, ObservableCollection<CAKE>>();
            
            using (var db = new CAKESTOREEntities())
            {
                db.CAKE_TYPE.ToList().ForEach(cat =>
                {
                    var cakeByCateIdList = db.CAKEs.Where(cake => cake.CAKE_TYPE == cat.TYPE_ID).ToList();
                    CakeCategories.Add(cat, new ObservableCollection<CAKE>(cakeByCateIdList));
                });
            };
        }
        public bool CanExecute => true;

        private void SelectedCategoryAction(object param)
        {
            var cate = param as CAKE_TYPE;
        }

        private void SelectedCakeAction(object param)
        {
            var cake = param as CAKE;

            var detailVm = new DetailViewModel
            {
                SelectedCake = cake
            };
            MainWindow.Instance.SetContentControl(detailVm);
        }

        private void ExecuteAddCateDialog(object obj)
        {
            throw new NotImplementedException();
        }

        private void ExecuteAddCakeDialog(object obj)
        {
            throw new NotImplementedException();
        }
    }
}
