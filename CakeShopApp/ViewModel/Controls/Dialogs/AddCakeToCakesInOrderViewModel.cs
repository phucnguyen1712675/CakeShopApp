using CakeShopApp.ViewModel.Controls.ContentControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakeShopApp.ViewModel.Controls.Dialogs
{
    class AddCakeToCakesInOrderViewModel : BaseViewModel
    {
        public CAKE_IN_ORDERS CakeInOrder { get; set; }
        public CAKE Cake { get; set; }
        public AddCakeToCakesInOrderViewModel(CAKE cake)
        {
            //Kieểm tra Cake này có trong order chưa 
            var CakeInOrderNow = CreateOrderScreenViewModel.Instance.GetAllCakeInOrderNow();
            Cake = cake;
            CakeInOrder = CakeInOrderNow.FirstOrDefault(item => item.CAKE_ID == cake.CAKE_ID);
            if(CakeInOrder == null)
            {
                //nếu chưa có thì tạo new và gán thong tin cake cơ bản
                CakeInOrder = new CAKE_IN_ORDERS();
                CakeInOrder.CAKE_ID = cake.CAKE_ID;
                CakeInOrder.CAKE = Cake;
                CakeInOrder.NUMBER = 1;
            }
        }
    }
}
