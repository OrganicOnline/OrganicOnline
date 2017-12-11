using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class User // UPDATE, DELETE
    {

    }

    public partial class GgDBEntities // SELECT, INSERT
    {
        public List<User> GetUserList()
        {
            return User.Where(i => i.Deleted == false).ToList();
        }

        public int AddUser(string ad, string soyad, string kullaniciAdi, string sifre, string eMail, int role)
        {
            User usr = new User();
            usr.Ad = ad;
            usr.Soyad = soyad;
            usr.Username = kullaniciAdi;
            usr.Password = sifre;
            usr.E_mail = eMail;
            usr.RoleID = role;
            AddToUser(usr);
            SaveChanges();
            return usr.ObjectID;
        }
        public User GetUserByUsernameAndPassword(string username, string password)
        {
           return User.FirstOrDefault(i => i.Username == username && i.Password == password && i.Deleted == false);
        }

    }

}
