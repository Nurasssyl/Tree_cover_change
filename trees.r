
libs <- c(
  "tidyverse", "terra",
  "sf", "exactextractr",
  "ggplot2", "units"
)

installed_libraries <- libs %in% rownames(installed.packages())
if (any(!installed_libraries)) {
  install.packages(libs[!installed_libraries])
}

invisible(lapply(libs, library, character.only = TRUE))


kaz_sf <- st_read("C:/Users/Admin/Рабочий стол/geokz-main/maps/kaz_admbnda_adm2_2024.shp")


tree_2020 <- rast("C:/Users/Admin/Рабочий стол/Trees/tree_cover_kazakhstan_2020_250m.tif")
tree_2024 <- rast("C:/Users/Admin/Рабочий стол/Trees/tree_cover_kazakhstan_2024_250m.tif")


tree_2020_stat <- exact_extract(tree_2020, kaz_sf, 'mean')
tree_2024_stat <- exact_extract(tree_2024, kaz_sf, 'mean')

kaz_df <- kaz_sf |>
  mutate(
    tree_cover_2020 = tree_2020_stat * 100,
    tree_cover_2024 = tree_2024_stat * 100,
    tree_cover_change = (tree_cover_2024 - tree_cover_2020) / tree_cover_2020 * 100
  )


map <- ggplot(kaz_df) +
  geom_sf(aes(fill = tree_cover_change), color = "white", size = 0.15) +
  scale_fill_gradient2(
    name = "%-change (2020–2024)",
    midpoint = 0,
    low = "#9e319d", mid = "#f7de7c", high = "#006f00"
  ) +
  guides(fill = guide_colorbar(
    direction = "horizontal",
    barheight = unit(1.5, "mm"),
    barwidth = unit(30, "mm"),
    title.position = "top",
    label.position = "bottom",
    title.hjust = .5,
    label.hjust = .5
  )) +
  theme_void() +
  theme(
    legend.position = "top",
    plot.margin = unit(c(0, 0, 0, 0), "lines")
  )

print(map)
