require 'securerandom'

module PostPagination
    class PaginatedPage < Jekyll::Page
        def initialize(site, directory, pageId, prevId, nextId)
            @site = site             # the current site instance.
            @base = site.source      # path to the source directory.
            @dir  = directory         # the directory the page will reside in.

            # All pages have the same filename, so define attributes straight away.
            @basename = pageId.to_s      # filename without the extension.
            @ext      = '.html'      # the extension.
            @name     = @basename + @ext # basically @basename + @ext.

            # Initialize data hash with a key pointing to all posts under current category.
            # This allows accessing the list in a template via `page.linked_docs`.
            @data = {
                'next_page' => @dir + "/" + @nextId.to_s + @ext,
                'previous_page' => @dir + "/" + @prevId.to_s + @ext,
                "content" => "hello bitches"
            }

            # Look up front matter defaults scoped to type `categories`, if given key
            # doesn't exist in the `data` hash.
            data.default_proc = proc do |_, key|
                site.frontmatter_defaults.find(relative_path, :categories, key)
            end
        end
    end


    class Generator < Jekyll::Generator
        def generate(site)
            
        end
    end
end