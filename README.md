ASP.NET WebFrom MVVM Demo
=========================

This started as a demo I shared one morning at a previous employer.

We were beginning a large new feature to be added to our current ASP.NET
WebForm site built for eCommerce. Management wanted solutions to be more
testable and fellow developers wanted our solutions to be better architected.

I stayed up late one evening doing research on WebForm controls new to .NET 4
and how I could bring some of the architectural concepts from .NET MVC to 
WebForms.

The result was this small demo project that I presented the sprint before we
would start development. Some of our staff only knew ASP.NET MVC, and some of
our staff only knew WebForms.

The goal was to treat pages as declarative model-bound templates and code
behinds as containers for view logic only.

The final production received an interface for a ViewModelPage with a generic
ViewModel property.
