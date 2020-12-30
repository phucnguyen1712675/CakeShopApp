using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace CakeShopApp.Domain
{
    public class IsNumericValidationRule : ValidationRule
    {
        private readonly List<string> badWordList = new List<string>()
        {
            " đồng",
            "."
        };
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var regex = new Regex(@"^\d+$", RegexOptions.Compiled | RegexOptions.IgnoreCase);
            var money = (value ?? "").ToString();

            foreach (string badWord in badWordList)
            {
                money = money.Replace(badWord, string.Empty);
            }

            return !regex.IsMatch(money)
                    ? new ValidationResult(false, "Price only contains number!")
                        : ValidationResult.ValidResult;
        }
    }
}
