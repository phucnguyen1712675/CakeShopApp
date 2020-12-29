using CakeShopApp.Model;
using CakeShopApp.Utils;
using CakeShopApp.View;
using CakeShopApp.ViewModel.Controls.ContentControls;
using MaterialDesignExtensions.Model;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Windows.Input;

namespace CakeShopApp.ViewModel
{
    public class MainWindowViewModel : BaseViewModel
    {
        private object _selectedItem;

        public static MainWindowViewModel Instance;
        public string Identifier { get; }
        public bool IsNavigationDrawerOpen { get; set; }
        public List<INavigationItem> NavigationItems { get; set; }
        public INavigationItem SelectedNavigationItem { get; set; }
        public IAutocompleteSource AutocompleteSource { get; }
        public bool IsChecked { get; set; }
        public ICommand DarkModeCommand => new AnotherCommandImplementation(ExecuteDarkModeModify);
        public object SelectedItem
        {
            get => this._selectedItem;
            set
            {
                this._selectedItem = value;

                if (this._selectedItem is CakeItem selectedCake)
                {
                    using (var db = new CAKESTOREEntities())
                    {
                        var cake = db.CAKEs.Find(selectedCake.Id);

                        MainWindow.Instance.SetContentControl(new DetailViewModel
                        {
                            SelectedCake = cake
                        });
                    };
                }
                else
                {
                    MainWindow.Instance.SetContentControl(new HomeScreenViewModel());
                }
            }
        }
        public MainWindowViewModel()
        {
            Instance = this;
            Identifier = "mainWindowDialogHost";
            IsNavigationDrawerOpen = false;
            NavigationItems = new List<INavigationItem>()
            {
                new FirstLevelNavigationItem() { Label = "Trang chủ", Icon = PackIconKind.Home, NavigationItemSelectedCallback = item => new HomeScreenViewModel(), IsSelected = true },
                new FirstLevelNavigationItem() { Label = "Thống kê", Icon = PackIconKind.CashUsd, NavigationItemSelectedCallback = item => new StatisticsViewModel()},
                new FirstLevelNavigationItem() { Label = "Thêm đơn hàng", Icon = PackIconKind.Cart, NavigationItemSelectedCallback = item => CreateOrderScreenViewModel.Instance }
            };
            SelectedNavigationItem = NavigationItems[0];

            this.AutocompleteSource = new CakeAutocompleteSource();
            this.SelectedItem = null;

            var value = ConfigurationManager.AppSettings["IsDarkMode"];
            this.IsChecked = bool.Parse(value);
            ModifyTheme(this.IsChecked);
        }

        private void ExecuteDarkModeModify(object obj)
        {
            ModifyTheme(this.IsChecked == true);
            SaveThemeMode(this.IsChecked == true);
        }

        private static void ModifyTheme(bool isDarkTheme)
        {
            var paletteHelper = new PaletteHelper();
            var theme = paletteHelper.GetTheme();

            theme.SetBaseTheme(isDarkTheme ? Theme.Dark : Theme.Light);
            paletteHelper.SetTheme(theme);
        }

        private void SaveThemeMode(bool isDarkTheme)
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["IsDarkMode"].Value = isDarkTheme.ToString();
            config.Save(ConfigurationSaveMode.Minimal);
        }
    }
}
