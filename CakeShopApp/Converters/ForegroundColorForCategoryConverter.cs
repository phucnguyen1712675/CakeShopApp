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
    public class ForegroundColorForCategoryConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == DependencyProperty.UnsetValue)
            {
                return DependencyProperty.UnsetValue;
            }
            bool isSelected = (bool)value;
            var result = isSelected ? (SolidColorBrush) Application.Current.Resources["PrimaryHueLightForegroundBrush"] : (SolidColorBrush) Application.Current.Resources["PrimaryHueDarkForegroundBrush"];
            return result;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
