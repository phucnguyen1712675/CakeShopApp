using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace CakeShopApp.Converters
{
    public class DoubleToVNDConverter : IValueConverter
    {
        private readonly List<string> badWordList = new List<string>()
        {
            " đồng",
            "."
        };
        private static string GetNumbers(string input)
        {
            return new string(input.Where(c => char.IsDigit(c)).ToArray());
        }

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == DependencyProperty.UnsetValue)
            {
                return DependencyProperty.UnsetValue;
            }
            if (value == null)
            {
                return null;
            }
            double money = (double)value;

            string result;

            if (money == 0.0)
            {
                result = "0";
            }
            else
            {
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                result = money.ToString("#,###", cul.NumberFormat);
            }
            return $"{result} đồng";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string money = (string)value;
            
            foreach (string badWord in badWordList)
            {
                money = money.Replace(badWord, string.Empty);
            }

            if (!money.All(char.IsDigit) && !string.IsNullOrEmpty(money))
            {
                money = GetNumbers(money);
                return double.Parse(money, CultureInfo.InvariantCulture);
            }

            return money;
        }
    }
}
