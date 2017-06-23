using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logger.Domain.Models.Response
{
    public class SearchResponse<T> : ItemsResponse<T>
    {
        public int ResultCount { get; set; }
    }
}
