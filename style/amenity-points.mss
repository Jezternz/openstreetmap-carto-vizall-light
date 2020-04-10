@protected-area: #999;
@aboriginal: #696969;

@landcover-font-size: 10;
@landcover-wrap-width-size: 30; // 3 em
@landcover-line-spacing-size: -1.5; // -0.15 em
@landcover-font-size-big: 12;
@landcover-wrap-width-size-big: 36; // 3 em
@landcover-line-spacing-size-big: -1.8; // -0.15 em
@landcover-font-size-bigger: 15;
@landcover-wrap-width-size-bigger: 45; // 3 em
@landcover-line-spacing-size-bigger: -2.25; // -0.15 em
@landcover-face-name: @oblique-fonts;

@standard-font-size: 10;
@standard-wrap-width: 30; // 3 em
@standard-line-spacing-size: -1.5; // -0.15 em
@standard-font: @book-fonts;

/* Note that these layers are also used in water.mss */
#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  [feature = 'place_island'][zoom >= 4][way_pixels > 3000],
  [feature = 'place_island'][zoom >= 16],
  [feature = 'place_islet'][zoom >= 11][way_pixels > 3000],
  [feature = 'place_islet'][zoom >= 17] {
    text-name: "[name]";
    text-fill: #000;
    text-size: @landcover-font-size;
    text-wrap-width: @landcover-wrap-width-size;
    text-line-spacing: @landcover-line-spacing-size;
    [way_pixels > 12000] {
      text-size: @landcover-font-size-big;
      text-wrap-width: @landcover-wrap-width-size-big;
      text-line-spacing: @landcover-line-spacing-size-big;
    }
    [way_pixels > 48000] {
      text-size: @landcover-font-size-bigger;
      text-wrap-width: @landcover-wrap-width-size-bigger;
      text-line-spacing: @landcover-line-spacing-size-bigger;
    }
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'place_locality'][zoom >= 16] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @placenames;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= 17] {
      text-size: 12;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
      text-fill: @placenames-light;
      text-halo-fill: white;
    }
  }

  [feature = 'landuse_military'],
  [feature = 'natural_wood'],
  [feature = 'landuse_forest'],
  [feature = 'boundary_national_park'],
  [feature = 'leisure_nature_reserve'],
  [feature = 'boundary_aboriginal_lands'],
  [feature = 'boundary_protected_area'] {
    [zoom >= 8][way_pixels > 3000][is_building = 'no'],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'landuse_military'] {
        text-fill: darken(@military, 40%);
      }
      [feature = 'boundary_aboriginal_lands'] {
        text-fill: @aboriginal;
      }
      [feature = 'natural_wood'],
      [feature = 'landuse_forest'] {
        text-fill: @forest-text;
      }
      [feature = 'boundary_national_park'],
      [feature = 'leisure_nature_reserve'],
      [feature = 'boundary_protected_area'] {
        text-fill: @protected-area;
      }
    }
  }

  [feature = 'military_danger_area'][is_building = 'no'] {
    [zoom >= 9][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@military, 20%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }
}
