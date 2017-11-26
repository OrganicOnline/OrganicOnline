using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class District
    {

    }
    public partial class GgDBEntities
    {
        District d = new District();
        public List<District> GetDistrictList()
        {
            return District.Where(i => i.Deleted == false).ToList();
        }
    }
}
