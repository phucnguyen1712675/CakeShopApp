using CakeShopApp.ViewModel.Controls.ContentControls;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CakeShopApp.View.Controls.ContentControls
{
    /// <summary>
    /// Interaction logic for CreateOrderScreenControl.xaml
    /// </summary>
    public partial class CreateOrderScreenControl : UserControl
    {
        public CreateOrderScreenControl()
        {
            InitializeComponent();
        }

        private void valueChangeNumber_TextChanged(object sender, TextChangedEventArgs e)
        {
            CreateOrderScreenViewModel.Instance.caculateTotalPrice();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var temp = CreateOrderScreenViewModel.Instance.ORDER;
        }
    }
}
