# Web scraping

library(rvest)

url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

imdb = read_html(url)

imdb %>% html_nodes("title")

# or
# more popular (modern r)
imdb %>% 
    html_nodes("title") %>% 
    html_text()
    
# get movie names
movies = imdb %>%
    html_nodes("h3.lister-item-header") %>%
    html_text()
    
# runtimes
runtimes =imdb %>%
    html_nodes("span.runtime") %>%
    html_text()
    
df = data.frame(movies, runtimes) # 2 columns
print(df)

# write csv file
df.to_csv("movies_runtimes.csv")
