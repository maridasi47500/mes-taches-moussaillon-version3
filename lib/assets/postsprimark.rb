class Category
  def initialize()
  end
  def myurl()
    ""
  end
  def catname()
    ""
  end
end
class Author
  def initialize(nameaut)
    @name=nameaut
  end
  def urlprofile()
    ""
  end
  def authorName()
    @name
  end
end
class Locale
  def icon()
    ""
  end
  def currency()
    ""
  end
  def name()
    ""
  end
end
class Authorimage
  def initialize(images)
    @images=images
    p @images
    p @images.first
  end
  def name()
    @images.first && @images.first.profilepic ? @images.first.profilepic.name : ""

  end
  def catname()
    ""

  end
end
#class Article
#  def initialize(x)
#    @photos=x.photos
#    @ps=x.posts_surnames
#    @title = x.title
#    @contents = x.contents
#    @surnames = x.surnames.pluck(:name).last
#  end
#  def suggestions(x)
#    []
#  end
#  def mainHeading()
#    @title
#  end
#  def title
#    @title
#  end
#  def author
#    [Author.new(@surnames)]
#  end
#  def mycategory
#    Category.new
#  end
#  def postcategory
#    ""
#  end
#  def contents
#    @contents
#  end
#  def bodycontents
#    [@post]
#  end
#  def headercontents
#    []
#  end
#  def contentincolumns
#    []
#  end
#  def authorName
#    @surnames
#  end
#  def bannerimages
#    @photos
#  end
#  def authorimages
#    [Authorimage.new(@ps)]
#  end
#  def catname()
#    ""
#  end
#end

