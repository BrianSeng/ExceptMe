using System.Data.Entity;

namespace Logger.Domain.DbContext
{
    public class ExceptionContext : System.Data.Entity.DbContext
    {
        public DbSet<Exception> Exceptions { get; set; }
    }
}
