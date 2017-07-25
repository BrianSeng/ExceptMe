using System.Data.Entity;

namespace Logger.Domain
{
    public class ExceptionDbContext : DbContext
    {
        public ExceptionDbContext(): base("DefaultConnection") 
        {
            Database.SetInitializer<ExceptionDbContext>(new CreateDatabaseIfNotExists<ExceptionDbContext>());
        }
        public DbSet<Exception> Exceptions { get; set; }
    }
}
