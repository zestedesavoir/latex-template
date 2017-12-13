utf8 = require "utf8-lua/utf8.lua"

AUTHOR_MAX_SIZE = 15
AUTHOR_MAX_DISPLAY = 11

array_authors = {}
array_authors_size = 0
numberOfColumns = 1

--  Split and Join a string into / from a table
--  source: http://www.wellho.net/resources/ex.php4?item=u105/spjo
function implode (delimiter, list)
   local len = #list
   if len == 0 then
      return ""
   end
   local string = list[0]
   for i = 1, len do
      string = string .. delimiter .. list[i]
   end
   return string
end

--  Create array of authors which contains for all author
--  - name : default name
--  - display_name : short name (less than AUTHOR_MAX_SIZE) that will be displayed
function makeAuthorsArray (authors)
   array_authors = {}
   local index = -1
   local tmp_name

   for word in string.gmatch (authors, '([^,]+)') do
      index = index + 1

      --  Trim
      tmp_name = string.format ("%s", word:match ("%s*(.+)%s*"))
      array_authors[index] = { name = tmp_name, display_name = tmp_name }

      --  Count number of backslash in string to remove it from the count of the size
      --  Note: this method no cover all backslash aspect (like command), it is just for simple char
      local numberOfBackslash = 0
      for i in string.gmatch (array_authors[index].display_name, "\\") do
         numberOfBackslash = numberOfBackslash + 1
      end

      --  Limit size of display name to AUTHOR_MAX_SIZE
      if (utf8.len (array_authors[index].display_name) - numberOfBackslash) > AUTHOR_MAX_SIZE then
         array_authors[index].display_name = string.sub (array_authors[index].display_name, 0, AUTHOR_MAX_SIZE - 3) .. "..."
      end
   end

   array_authors_size = index
end

--  Display athors
--  If "all" parameter is not nil, this will display all authors
function displayAuthors (link, all)
   all = all or false
   local index = array_authors_size

   if index > AUTHOR_MAX_DISPLAY and not all then
      index = AUTHOR_MAX_DISPLAY
   end

   local tab = {}

   for i = 0, index do
      tab[i] = "\\href{" .. link .. "/" .. array_authors[i].name .. "/}{\\color{titlePageAuthorColor}\\bsc{" .. array_authors[i].display_name .. "}}\\\\"
   end

   local strAuthors = implode (",", tab)

   if array_authors_size > AUTHOR_MAX_DISPLAY and not all then
      strAuthors = strAuthors .. ", \\hyperlink{authorsList}{\\color{titlePageAuthorColor}\\bsc{et " ..
         (array_authors_size - AUTHOR_MAX_DISPLAY) .. " autre(s) auteur(s)}}\\\\"
   end

   print (strAuthors)

   tex.print ("\\expandafter\\docsvlist\\expandafter{" .. strAuthors .. "}")
end

--  Return the number of authors can be displayed (lower or equal to AUTHOR_MAX_DISPLAY)
function getAuthorsNumberMaxDisplayed ()
   if array_authors_size > AUTHOR_MAX_DISPLAY then
      return AUTHOR_MAX_DISPLAY
   else
      return array_authors_size
   end
end

--  Format authors for displaying on cover
function formatAuthors (authors, link)
   makeAuthorsArray (authors)
   local authorsByColumn = 5
   local authorsNumber = getAuthorsNumberMaxDisplayed ()

   numberOfColumns = math.ceil (authorsNumber / authorsByColumn)

   if numberOfColumns > 1 then
      tex.print ("\\begin{multicols}{" .. numberOfColumns .. "}")
   end

   displayAuthors (link)

   if numberOfColumns > 1 then
      tex.print ("\\end{multicols}")
   end
end

--  Create page for display all authors, only if all authors are not displayed on cover
function makeAuthorsPage (link)

   if array_authors_size <= AUTHOR_MAX_DISPLAY then
      --  Displaying this page only if all authors are not displayed on cover
      return
   end

   if numberOfColumns > 1 then
      tex.print ("\\begin{center}\\section*{\\hypertarget{authorsList}{Auteurs}}\\end{center}\\begin{multicols}{" .. numberOfColumns .. "}")
   end

   displayAuthors(link, true)

   if numberOfColumns > 1 then
      tex.print ("\\end{multicols}\\newpage")
   end
end
