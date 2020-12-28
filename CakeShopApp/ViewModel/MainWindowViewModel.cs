using CakeShopApp.Utils;
using CakeShopApp.ViewModel.Controls.ContentControls;
using MaterialDesignExtensions.Controls;
using MaterialDesignExtensions.Model;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CakeShopApp.ViewModel
{
    public class MainWindowViewModel : BaseViewModel
    {
        public static MainWindowViewModel Instance;
        public string Identifier { get; }
        public bool IsNavigationDrawerOpen { get; set; }
        public List<INavigationItem> NavigationItems { get; set; }
        public INavigationItem SelectedNavigationItem { get; set; }
        
        public MainWindowViewModel()
        {
            Instance = this;
            Identifier = "mainWindowDialogHost";
            IsNavigationDrawerOpen = false;
            NavigationItems = new List<INavigationItem>()
            {
                new FirstLevelNavigationItem() { Label = "Trang chủ", Icon = PackIconKind.Home, NavigationItemSelectedCallback = item => new HomeScreenViewModel(), IsSelected = true },
                new FirstLevelNavigationItem() { Label = "Thêm đơn hàng", Icon = PackIconKind.Cart, NavigationItemSelectedCallback = item => CreateOrderScreenViewModel.Instance, IsSelected = true },
                //new FirstLevelNavigationItem() { Label = "Thống kê", Icon = PackIconKind.CashUsd, NavigationItemSelectedCallback = item => new HomeScreenViewModel()},
                //new FirstLevelNavigationItem() { Label = "Thêm món bánh mới", Icon = PackIconKind.Plus, NavigationItemSelectedCallback = item => new HomeScreenViewModel() },
                new FirstLevelNavigationItem() { Label = "Cài đặt", Icon = PackIconKind.Settings, NavigationItemSelectedCallback = item => new SettingViewModel() }
            };
            SelectedNavigationItem = NavigationItems[0];
        }
    }
}
