using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GgDB
{
    public enum ChangeAction
    {
        Insert,
        Update,
        Delete
    }

    public interface IValidate
    {
        void Validate(ChangeAction action);
    }
}
