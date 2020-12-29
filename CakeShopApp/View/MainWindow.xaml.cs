using CakeShopApp.ViewModel;
using CakeShopApp.ViewModel.Controls.ContentControls;
using MaterialDesignExtensions.Controls;
using MaterialDesignExtensions.Model;

namespace CakeShopApp.View
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : MaterialWindow
    {
        public static MainWindow Instance;
        public MainWindow()
        {
            InitializeComponent();
            Instance = this;
            DataContext = new MainWindowViewModel();
        }

        private void NavigationItemSelectedHandler(object sender, NavigationItemSelectedEventArgs args) => SelectNavigationItem(args.NavigationItem);

        public void SetContentControl(object newContent)
        {
            contentControl.Content = newContent;

            if (newContent is HomeScreenViewModel)
            {
                autocomplete.ClearSelection();
            }
        }

        private void SelectNavigationItem(INavigationItem navigationItem)
        {
            if (navigationItem != null)
            {
                object newContent = navigationItem.NavigationItemSelectedCallback(navigationItem);

                if (contentControl.Content == null || contentControl.Content.GetType() != newContent.GetType())
                {
                    SetContentControl(newContent);
                }
            }
            else
            {
                SetContentControl(null);
            }

            if (appBar != null)
            {
                appBar.IsNavigationDrawerOpen = false;
            }
        }
    }
}
