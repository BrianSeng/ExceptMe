using System.Data.Entity;

namespace Logger.Domain
{
    public class ExceptionContext : DbContext
    {
        public DbSet<Exception> Exceptions { get; set; }
    }
}
