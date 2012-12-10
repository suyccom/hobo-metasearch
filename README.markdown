Hobo MetaSearch
===============

This plugin enables beautiful and dry filters for Hobo's table-plus. 

It uses the (ransack gem)[https://github.com/ernie/ransack] (previously metasearch) to replace Hobo's apply_scopes trick in the index page. Moreover, it also replaces the sorting links in the table-plus.

In the branch hobo1.3 lies an older version for Hobo 1.3.

Current version has been rewritten for Hobo 2.0 and tested with the theme hobo_bootstrap.

<a href="http://www.imagebanana.com/"><img style="border:0px;" alt="ImageBanana - Seleccin_001.png" src="http://i.imagebanana.com/img/ckfeziqk/Seleccin_001.png" /></a>



How to use
----------

Add it to your Gemfile:

    gem 'hobo-metasearch', :git => "git://github.com/Hobo/hobo-metasearch"


Run bundle, and go to your application.dryml or front_site.dryml and include the taglibs:

    <include gem="hobo-metasearch" />

In your controller you have to redefine index, so it uses the metasearch engine

    def index
      @search = Project.search(params[:q])
      @events = @search.paginate(:page => params[:page])
    end
  
And finally you need to use table-plus-with-filters in your index.dryml:

    <index-page>
      <collection: replace>
        <table-plus-with-filters with="&@projects" fields="id, this, zone, category, project_date, owner, status"/>
      </collection>
    </index-page>


Restart your application and you are good to go! By default it uses all available fields as filters, but you can use the "filters" param to override. It is usually a good idea to remove the pagination in index-pages:

    <index-page>
      <collection: replace>
        <table-plus-with-filters with="&@events" fields="id, this, zone, category, event_date, owner, status" filters="title, zone, category">
          <page-nav: replace/>
        </table-plus-with-filters>
      </collection>
    </index-page>

