# You can configure Blacklight from here. 
#   
#   Blacklight.configure(:environment) do |config| end
#   
# :shared (or leave it blank) is used by all environments. 
# You can override a shared key by using that key in a particular
# environment's configuration.
# 
# If you have no configuration beyond :shared for an environment, you
# do not need to call configure() for that envirnoment.
# 
# For specific environments:
# 
#   Blacklight.configure(:test) {}
#   Blacklight.configure(:development) {}
#   Blacklight.configure(:production) {}
# 

Blacklight.configure(:shared) do |config|
  # Blacklight's default SOLR Request Handler (defined in solr/conf/solrconfig.xml)
  config[:default_qt] = "search"
  

  # solr field values given special treatment in the show (single result) view
  config[:show] = {
    :html_title => "title_t",
    :heading => "title_t",
    :display_type => "format_code_t"
  }

  # solr fld values given special treatment in the index (search results) view
  config[:index] = {
    :show_link => "title_t",
    :num_per_page => 10,
    :record_display_type => "format_code_t"
  }

  # solr fields that will be treated as facets by the blacklight application
  #   The field_names and the labels MUST have the same keys in the same order 
  config[:facet] = {
    :field_names => [
      "language_facet",
      "subject_facet",
      "geographic_subject_facet",
      "genreform_facet",
      "format_facet",
      "publisher_facet"
    ],
    :labels => {
      "language_facet"           => "Language",
      "subject_facet"            => "Subject",
      "geographic_subject_facet" => "Subject - Geographic",
      "genreform_facet"          => "Genre / Form",
      "format_facet"             => "Format",
      "publisher_facet"          => "Publisher"
    }
  }

  # solr fields to be displayed in the index (search results) view
  #   The field_names and the labels MUST have the same keys in the same order 
  config[:index_fields] = {
    :field_names => [
      "title_t",
      "author_t",
      "format_facet",
      "language_facet",
      "published_t"
    ],
    :labels => {
      "title_t"        => "Title:",
      "author_t"       => "Author:",
      "format_facet"   => "Format:",
      "language_facet" => "Language:",
      "published_t"    => "Published:"
    }
  }

  # solr fields to be displayed in the show (single result) view
  #   The field_names and the labels MUST have the same keys in the same order 
  config[:show_fields] = {
    :field_names => [
      "title_t",
      "sub_title_t",
      "author_t",
      "format_facet",
      "material_type_t",
      "language_facet",
      "published_t",
      "isbn_t"
    ],
    :labels => {
      "title_t"         => "Title:",
      "sub_title_t"     => "Subtitle:",
      "author_t"        => "Author:",
      "format_facet"    => "Format:",
      "material_type_t" => "Physical description:",
      "language_facet"  => "Language:",
      "published_t"     => "Published:",
      "isbn_t"          => "ISBN:"      
    }
  }

  # "fielded" search select (pulldown)
  # label in pulldown is followed by the name of a SOLR request handler as 
  # defined in solr/conf/solrconfig.xml
  config[:search_fields] ||= []
  config[:search_fields] << ['All Fields', 'search']
  config[:search_fields] << ['Author', 'author_search']
  config[:search_fields] << ['Title', 'title_search']
  
  # "sort results by" select (pulldown)
  # label in pulldown is followed by the name of the SOLR field to sort by and
  # whether the sort is ascending or descending (it must be asc or desc
  # except in the relevancy case).
  # label is key, solr field is value
  config[:sort_fields] ||= []
  config[:sort_fields] << ['relevance', '']
  config[:sort_fields] << ['title', 'title_sort asc']
  config[:sort_fields] << ['format', 'format_sort asc']
  
  # ###################################################################
  # Configuration related to specific kinds of objects
  
  # ################
  # MaRC
  # type of raw data in index.  Currently marcxml and marc21 are supported.
  config[:raw_storage_type] = "marcxml"
  # name of solr field containing raw data
  config[:raw_storage_field] = "marc_display"
  
  # ################
  # EAD
  # by default, an object is assumed to be an EAD if it has something stored in ead_display
  config[:ead_storage_field] = "ead_display"
  
  # ################
  # Dublin Core
  # 
  config[:dc_storage_field] = "dc_display"
  
  # ################
  # MODS
  config[:mods_storage_field] = "mods_display"
  
  # ################
  # objects that have a parent
  config[:parent_id] = "parent_id_s"
end

