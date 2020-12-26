using CakeShopApp.Utils;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CakeShopApp.ViewModel
{
    public class SplashScreenViewModel : BaseViewModel
    {
        public ObservableCollection<string> Facts { get; }
        public string RandomFact { get; } 
        public bool IsChecked { get; set; }
        private ICommand _checkCommand { get; set; }
        public ICommand CheckCommand => _checkCommand ?? (_checkCommand = new CommandHandler((param) => CheckAction(), () => CanExecute));

        public SplashScreenViewModel()
        {
            Facts = new ObservableCollection<string>
            {
                "Những chiếc bánh cupcake đầu tiên được gọi như vậy, bởi vì vào cuối thế kỷ 19, chúng được nướng trong cốc và làm từ các nguyên liệu được đo bằng cốc.",
                "Vào thời Trung Cổ, từ cake có nghĩa là một hình tròn phẳng của bánh mì được nướng cứng ở cả hai mặt.",
                "Lần đầu tiên cup cake nhắc đến là vào năm 1796 trong American Cookery của Amelia Simmon.",
                "Kỷ lục thế giới về ăn bánh cupcake là 72 cái trong sáu phút và được thiết lập bởi Patrick Bertoletti vào năm 2012.",
                "Kỷ lục ăn bánh trái cây là 4lb 14,25oz trong 10 phút, do Sonya Thomas lập năm 2003.",
                "Tu viện Assumption ở Missouri là tu viện Trappist duy nhất trên thế giới bán bánh trái trên internet (trappistmonks.com).",
                "Một tòa án VAT năm 1991 đã phán quyết rằng Jaffa Cakes là bánh ngọt không phải bánh quy.",
                "Đối với mục đích thuế, sự khác biệt cơ bản giữa bánh ngọt và bánh quy là bánh sẽ cứng khi cũ nhưng bánh quy lại mềm.",
                "Theo một lời mê tín cổ xưa của người Anh, đặt một chiếc bánh trái cây dưới gối sẽ khiến bạn mơ thấy người mà bạn sẽ kết hôn.",
                "Nữ hoàng Victoria là một trong những người đầu tiên gắn băng trắng tinh trên bánh cưới của mình. Đó là lý do tại sao nó được gọi là đóng băng hoàng gia."
            };
            //Get random fact
            var count = this.Facts.Count;
            var index = MyRandom.Instance.Next(count);
            this.RandomFact = this.Facts[index];

            IsChecked = false;
        }

        public bool CanExecute => true;
        private void CheckAction()
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["IsSplashScreenAllowed"].Value = (!IsChecked).ToString();
            config.Save(ConfigurationSaveMode.Minimal);
        }
    }
}
