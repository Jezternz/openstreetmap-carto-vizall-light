// --- Parks, woods, other green things ---

@park-global: #dde0de;

@forest-text: lighten(@park-global, 33%);  // Lch(40,30,135)
@park: @park-global;         // Lch(94,30,145)
@hedge: @park-global;       // Lch(80,30,135)
@beach: lighten(@park-global, 10%);

// --- "Base" landuses ---

@residential: #e0dfdf;      // Lch(89,0,0)
@industrial: #ededed;       // Lch(89,9,330) (Also used for railway, wastewater_plant)
@industrial-line: #c7c7c7;  // Lch(75,11,330) (Also used for railway-line, wastewater_plant-line)

// --- Transport ----

@railway: @industrial;
@railway-line: @industrial-line;

// --- Other ----

@tourism: #999;
@military: #999;


#landcover-low-zoom[zoom < 10],
#landcover[zoom >= 10] {
  

  [feature = 'landuse_railway'][zoom >= 10] {
    polygon-fill: @railway;
    [zoom >= 16][name != ''] {
      line-width: 0.7;
      line-color: @railway-line;
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_beach'][zoom >= 10],
  [feature = 'natural_shoal'][zoom >= 10] {
    polygon-fill: @beach;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }
}

#barriers {
  [zoom >= 16] {
    line-width: 0.4;
    line-color: #444;
  }
  [feature = 'barrier_hedge'][zoom >= 16] {
    line-width: 1.5;
    line-color: @hedge;
    [zoom >= 17] {
      line-width: 2;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
  [feature = 'historic_citywalls'],
  [feature = 'barrier_city_wall'] {
    [zoom >= 15] {
      line-width: 1;
      line-color: lighten(#444, 30%);
    }
    [zoom >= 16] {
      line-width: 1.5;
    }
    [zoom >= 17] {
      line-width: 2;
      barrier/line-width: 0.4;
      barrier/line-color: #444;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
}

#tourism-boundary {
  [tourism = 'zoo'][zoom >= 10][way_pixels >= 750],
  [tourism = 'zoo'][zoom >= 17],
  [tourism = 'theme_park'][zoom >= 10][way_pixels >= 750],
  [tourism = 'theme_park'][zoom >= 17] {
    a/line-width: 1;
    a/line-offset: -0.5;
    a/line-color: @tourism;
    a/line-opacity: 0.5;
    a/line-join: round;
    a/line-cap: round;
    [zoom >= 17],
    [way_pixels >= 60] {
      b/line-width: 4;
      b/line-offset: -2;
      b/line-color: @tourism;
      b/line-opacity: 0.3;
      b/line-join: round;
      b/line-cap: round;
    }
    [zoom >= 17] {
      a/line-width: 2;
      a/line-offset: -1;
      b/line-width: 6;
      b/line-offset: -3;
    }
  }
}

#text-line {
  [feature = 'natural_arete'][zoom >= 15],
  [feature = 'natural_cliff'][zoom >= 15],
  [feature = 'natural_ridge'][zoom >= 15],
  [feature = 'man_made_embankment'][zoom >= 15] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-fill: #999;
    text-size: 10;
    text-face-name: @book-fonts;
    text-placement: line;
    text-dy: 8;
    text-vertical-alignment: middle;
    text-spacing: 400;
  }
}
