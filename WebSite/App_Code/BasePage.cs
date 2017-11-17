using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GgDB;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    private GgDBEntities field;

    public GgDBEntities GgDbProvider
    {
        get 
        {
            if (field == null)
                field = new GgDBEntities();
            return field; 
        }
    }
    //private List<Product> list;

    //public List<Product> Liste
    //{
    //    get 
    //    {
    //        if (list == null)
    //            list = new List<Product>();
    //        return list;
    //    }
    //}
    


}