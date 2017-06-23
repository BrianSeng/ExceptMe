﻿using Logger.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logger.Domain.Services.Data
{
    public sealed class DataProvider
    {
        private DataProvider()
        {

        }

        public static IDao Instance
        {
            get
            {
                return SqlDao.Instance;
            }
        }
    }
}
