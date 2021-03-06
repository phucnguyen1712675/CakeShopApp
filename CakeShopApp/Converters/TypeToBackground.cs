﻿using System;
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
    public class TypeToBackground : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var _imageID = value;
            
            switch (_imageID)
            {
                case 1:
                    return "/Resources/Images/1.jpg";
                case 2:
                    return "/Resources/Images/2.jpg";
                case 3:
                    return "/Resources/Images/3.jpg";
                case 4:
                    return "/Resources/Images/4.jpg";
                case 5:
                    return "/Resources/Images/5.jpg";
                case 6:
                    return "/Resources/Images/6.jpg";
                case 7:
                    return "/Resources/Images/7.jpg";
                case 8:
                    return "/Resources/Images/8.jpg";
                case 9:
                    return "/Resources/Images/9.jpg";
                case 10:
                    return "/Resources/Images/10.jpg";
                case 11:
                    return "/Resources/Images/11.jpg";
                default:
                    return "/Resources/Images/12.jpg";
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
