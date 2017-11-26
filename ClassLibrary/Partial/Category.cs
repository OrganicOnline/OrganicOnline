using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class Category
    {
        
    }
    public partial class GgDBEntities
    {
        public List<Category> GetCategoryList()
        {
            return Category.Where(i => i.Deleted == false).ToList();
        }
    }
}
