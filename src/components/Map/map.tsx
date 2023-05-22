import { useEffect, useRef } from "react";
import * as am5 from "@amcharts/amcharts5";
import * as am5map from "@amcharts/amcharts5/map";
import am4geodata_worldLow from "@amcharts/amcharts4-geodata/worldLow";
import am5themes_Animated from "@amcharts/amcharts5/themes/Animated";
import * as geojson from "geojson";
import { IMapPolygonSeriesDataItem } from "@amcharts/amcharts5/map";
import { getInfo } from '../../api/InfoCountries';

async function getInfoForCountry(countryName: string) {
  const info = await getInfo();
  if (!info) {
    return {
      users: 0,
      topScore: 0
    };
  }
  const countryInfo = info[countryName];
  if (countryInfo) {
    return {
      users: countryInfo.users,
      topScore: countryInfo.topScore
    };
  } else {
    return {
      users: 0,
      topScore: 0
    };
  }
}



interface IProps {
  className?: string;
}

const MapChart: React.FC<IProps> = ({ className }) => {
  const chartRef = useRef<am5map.MapChart | null>(null);
  const rootRef = useRef<am5.Root | null>(null);

  useEffect(() => {
    const createChart = async () => {
      if (!chartRef.current) {
        if (!rootRef.current) {
          // Create root element if it doesn't exist
          rootRef.current = am5.Root.new("chartdiv");
          rootRef.current.setThemes([am5themes_Animated.new(rootRef.current)]);
        }

        // Fetch and process data
        const worldLowData: geojson.FeatureCollection<geojson.Geometry, geojson.GeoJsonProperties> =
          am4geodata_worldLow as any;

        const activeCountries = [''];
        
        await Promise.all(
          worldLowData.features.map(async (feature) => {
            const countryName = feature.properties?.name;
            const { users, topScore } = await getInfoForCountry(countryName);
            if (users > 0) {
              activeCountries.push(countryName);
            }
            feature.properties = {
              ...feature.properties,
              users,
              topScore,
            };
          })
        );


        // Create the map chart
        if (!chartRef.current) {
          chartRef.current = rootRef.current.container.children.push(
            am5map.MapChart.new(rootRef.current, {
              panX: "translateX",
              panY: "translateY",
              projection: am5map.geoMercator(),
            })
          ) as am5map.MapChart;
        }
        

        // Create main polygon series for countries
        const polygonSeries = chartRef.current.series.push(
          am5map.MapPolygonSeries.new(rootRef.current, {
            geoJSON: worldLowData,
            exclude: ["AQ"],
          })
        ) as am5map.MapPolygonSeries;



        polygonSeries.mapPolygons.template.setAll({
          tooltipText: "{name}\nUsers : {users}\nTop Score : {topScore}",
          toggleKey: "active",
          interactive: true,
          fill: am5.color("#FCBD2A"),
          stroke: am5.color("#000000"),
          strokeWidth: 0.5,
          templateField: "polygonSettings"
        });

        polygonSeries.mapPolygons.template.adapters.add("fill", (fill, target) => {
          if (target.dataItem) {
            const countryName = (target.dataItem.dataContext as any).name;
            if (activeCountries.includes(countryName)) {
              return am5.color("#FF6E31");
            }
          }
          return fill;
        });


        polygonSeries.mapPolygons.template.states.create("hover", {
          fill: am5.color("#6794DC")
        });


        polygonSeries.mapPolygons.template.states.create("active", {
          fill: am5.color("#FF6E31")

        });

        let previousPolygon: am5map.MapPolygon | undefined;

        polygonSeries.mapPolygons.template.on("active", function (active, target) {

          if (previousPolygon && previousPolygon !== target) {
            previousPolygon.set("active", false);
          }
          if (target?.get("active")) {
            const dataItem: am5.DataItem<IMapPolygonSeriesDataItem> = target.dataItem as am5.DataItem<IMapPolygonSeriesDataItem>;
            polygonSeries.zoomToDataItem(dataItem);
          } else {
            chartRef.current?.goHome();
          }
          previousPolygon = target;
        });

        // Add zoom control
        chartRef.current.set(
          "zoomControl",
          am5map.ZoomControl.new(rootRef.current, {})
        );


        // Set clicking on "water" to zoom out
        chartRef.current?.chartContainer
          ?.get("background")
          ?.events.on("click", function () {
            chartRef.current?.goHome();
          });

        // Make stuff animate on load
        chartRef.current.appear(1000, 100);
      }
    };
    createChart();
  }, []);



  return <div className={className} id="chartdiv" style={{ width: "100%", height: "500px" }} />;
};

export default MapChart;
