using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

namespace CakeShopApp.Converters
{
    public class BackgroundColorForCategoryConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == DependencyProperty.UnsetValue)
            {
                return DependencyProperty.UnsetValue;
            }
            bool isSelected = (bool)value;
            var result = isSelected ? (SolidColorBrush) Application.Current.Resources["PrimaryHueLightBrush"] : (SolidColorBrush) Application.Current.Resources["PrimaryHueDarkBrush"];
            return result;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
