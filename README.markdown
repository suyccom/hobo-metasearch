Hobo MetaSearch
===============

This plugin enables beautiful and dry filters for Hobo's table-plus. 

It uses the metaseach gem to replace Hobo's apply_scopes trick in the index page. Moreover, it also replaces the sorting links in the table-plus so they work nicely.

It has only been tested with the ["nice" template](https://github.com/suyccom/hobo-nice-template).

[Screenshots available here](https://github.com/suyccom/hobo-metasearch/wiki).


Requirements
------------

* Rails 3.0.9 gem
* Hobo 1.3.0.RC2 gem
* [Metasearch 1.0.6 gem](https://github.com/ernie/meta_search)
* [Hobo Jquery plugin or gem](https://github.com/bryanlarsen/hobo-jquery/tree/rails3)
* [Hobo Contrib plugin](https://github.com/bryanlarsen/hobo-contrib)
* Hobo Nice Template plugin
* Git


How to use
----------

Install it like this:

    rails plugin install git://github.com/suyccom/hobo-metasearch.git


Go to your application.dryml or front_site.dryml and include the taglibs:

    <include plugin="hobo-metasearch" />

In your controller you have to redefine index, so it uses the metasearch engine

    def index
      @search = Event.search(params[:search])
      @events = @search.paginate(:page => params[:page])
    end
  
And finally you need to use a table-plus in your index.dryml:

    <index-page>
      <collection: replace>
        <table-plus with="&@events" fields="id, this, zone, category, event_date, owner, status"/>
      </collection>
    </index-page>


Restart your application and you are good to go! By default it uses all available fields as filters, but you can use the "filters" param to override:

    <index-page>
      <collection: replace>
        <table-plus with="&@events" fields="id, this, zone, category, event_date, owner, status" filters="title, zone, category" />
      </collection>
    </index-page>


How to update
-------------

Just reinstall:

    rails plugin install --force git://github.com/suyccom/hobo-metasearch.git
    
And restart the application :)



Copyright (c) 2011 Ignacio Huerta (http://www.unoycero.com), released under the MIT license
