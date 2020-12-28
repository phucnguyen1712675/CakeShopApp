using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakeShopApp.Utils
{
    public static class DictionaryHelper
    {
        public static bool UpdateKey<TKey, TValue>(this IDictionary<TKey, TValue> dic, TKey fromKey, TKey toKey)
        {
            TValue value;
            if (!dic.TryGetValue(fromKey, out value))
            {
                return false;
            }
            dic.Remove(fromKey);
            dic[toKey] = value;
            return true;
        }
    }
}
