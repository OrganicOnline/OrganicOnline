using System;
using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public partial class Comment : IValidate
    {
        void IValidate.Validate(ChangeAction action)
        {
            if (action == ChangeAction.Insert)
            {
                if (String.IsNullOrEmpty(this.CommnetBody))
                    throw new InvalidOperationException("Comment must contain some text in its body.");

                if(this.Product != null && this.Product.Order != null)
                {
                    if (this.Product.Order.FirstOrDefault(i => i.CustomerId == this.UserId) == null)
                        throw new InvalidOperationException("A comment without order not possible.");
                }


            }
        }
    }





    public partial class GgDBEntities // SELECT, INSERT
    {
        public List<Comment> GetCommentListForProduct(int productId)
        {
            return Comment.Where(i => i.ProductId == productId && i.Deleted != true && i.IsApproved == true).ToList();
        }
        public List<Comment> GetCommentListForStore(int supplierId)
        {
            return Comment.Where(i => i.Product.SupplierID == supplierId && i.Deleted != true && i.IsApproved == true).ToList();
        }

        public int AddComment(string header, string body, int userId, int productId, int star)
        {
            Comment Com = new Comment();
            Com.CommentHeader = header;
            Com.CommnetBody = body;
            Com.UserId = userId;
            Com.ProductId = productId;
            Com.IsApproved = false;
            Com.Deleted = false;
            Com.ApprovedDate = null;
            Com.CommentDate = DateTime.Now;
            Com.ApproverID = null;
            Com.Star = star;

            AddToComment(Com);
            SaveChanges();
            return Com.ObjectId;

        }

        public void approveComment(int id, int userId)
        {

            Comment.Where(a => a.ObjectId == id).First().IsApproved = true;
            Comment.Where(a => a.ObjectId == id).First().ApproverID = userId;
            Comment.Where(a => a.ObjectId == id).First().ApprovedDate = DateTime.Now;
            SaveChanges();

        }

        //public int AddUser(string ad, string soyad, string kullaniciAdi, string sifre, string eMail, int role)
        //{
        //    User usr = new User();
        //    usr.Ad = ad;
        //    usr.Soyad = soyad;
        //    usr.Username = kullaniciAdi;
        //    usr.Password = sifre;
        //    usr.E_mail = eMail;
        //    usr.RoleID = role;
        //    AddToUser(usr);
        //    SaveChanges();
        //    return usr.ObjectID;
        //}
        //public User GetUserByUsernameAndPassword(string username, string password)
        //{
        //    return User.FirstOrDefault(i => i.Username == username && i.Password == password && i.Deleted == false);
        //}

    }
























}
