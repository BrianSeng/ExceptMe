using System;
using System.Runtime.Serialization;

namespace Logger.Domain.Exceptions
{
    [Serializable]
    public class WebApiMissingRouteException : System.Exception
    {
        public WebApiMissingRouteException()
        {

        }
        public WebApiMissingRouteException(string message)
            : base(message)
        {

        }
        public WebApiMissingRouteException(string message, System.Exception inner)
            : base(message, inner)
        {

        }
        protected WebApiMissingRouteException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {

        }
    }
}
