<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/12
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="http://cdn.bootcss.com/echarts/3.1.10/echarts.min.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    // 数据意义：开盘(open)，收盘(close)，最低(lowest)，最高(highest)
    var data0 = splitData([
        ['2013/1/24', 2320.26,2320.26,2287.3,2362.94],
        ['2013/1/25', 2300,2291.3,2288.26,2308.38],
        ['2013/1/28', 2295.35,2346.5,2295.35,2346.92],
        ['2013/1/29', 2347.22,2358.98,2337.35,2363.8],
        ['2013/1/30', 2360.75,2382.48,2347.89,2383.76],
        ['2013/1/31', 2383.43,2385.42,2371.23,2391.82],
        ['2013/2/1', 2377.41,2419.02,2369.57,2421.15],
        ['2013/2/4', 2425.92,2428.15,2417.58,2440.38],
        ['2013/2/5', 2411,2433.13,2403.3,2437.42],
        ['2013/2/6', 2432.68,2434.48,2427.7,2441.73],
        ['2013/3/25', 2334.74,2326.72,2319.91,2344.89],
        ['2013/3/26', 2318.58,2297.67,2281.12,2319.99],
        ['2013/3/27', 2299.38,2301.26,2289,2323.48],
        ['2013/3/28', 2273.55,2236.3,2232.91,2273.55],
        ['2013/3/29', 2238.49,2236.62,2228.81,2246.87],
        ['2013/4/1', 2229.46,2234.4,2227.31,2243.95],
        ['2013/4/2', 2234.9,2227.74,2220.44,2253.42],
        ['2013/4/3', 2232.69,2225.29,2217.25,2241.34],
        ['2013/4/8', 2196.24,2211.59,2180.67,2212.59],
        ['2013/4/9', 2215.47,2225.77,2215.47,2234.73],
        ['2013/4/10', 2224.93,2226.13,2212.56,2233.04],
        ['2013/4/11', 2236.98,2219.55,2217.26,2242.48],
        ['2013/4/12', 2218.09,2206.78,2204.44,2226.26],
        ['2013/4/15', 2199.91,2181.94,2177.39,2204.99],
        ['2013/4/16', 2169.63,2194.85,2165.78,2196.43],
        ['2013/4/17', 2195.03,2193.8,2178.47,2197.51],
        ['2013/4/18', 2181.82,2197.6,2175.44,2206.03],
        ['2013/4/19', 2201.12,2244.64,2200.58,2250.11],
        ['2013/4/22', 2236.4,2242.17,2232.26,2245.12],
        ['2013/4/23', 2242.62,2184.54,2182.81,2242.62],
        ['2013/4/24', 2187.35,2218.32,2184.11,2226.12],
        ['2013/4/25', 2213.19,2199.31,2191.85,2224.63],
        ['2013/4/26', 2203.89,2177.91,2173.86,2210.58],
        ['2013/5/2', 2170.78,2174.12,2161.14,2179.65],
        ['2013/5/3', 2179.05,2205.5,2179.05,2222.81],
        ['2013/5/6', 2212.5,2231.17,2212.5,2236.07],
        ['2013/5/7', 2227.86,2235.57,2219.44,2240.26],
        ['2013/5/8', 2242.39,2246.3,2235.42,2255.21],
        ['2013/5/9', 2246.96,2232.97,2221.38,2247.86],
        ['2013/5/10', 2228.82,2246.83,2225.81,2247.67],
        ['2013/5/13', 2247.68,2241.92,2231.36,2250.85],
        ['2013/5/14', 2238.9,2217.01,2205.87,2239.93],
        ['2013/5/15', 2217.09,2224.8,2213.58,2225.19],
        ['2013/5/16', 2221.34,2251.81,2210.77,2252.87],
        ['2013/5/17', 2249.81,2282.87,2248.41,2288.09],
        ['2013/5/20', 2286.33,2299.99,2281.9,2309.39],
        ['2013/5/21', 2297.11,2305.11,2290.12,2305.3],
        ['2013/5/22', 2303.75,2302.4,2292.43,2314.18],
        ['2013/5/23', 2293.81,2275.67,2274.1,2304.95],
        ['2013/5/24', 2281.45,2288.53,2270.25,2292.59],
        ['2013/5/27', 2286.66,2293.08,2283.94,2301.7],
        ['2013/5/28', 2293.4,2321.32,2281.47,2322.1],
        ['2013/5/29', 2323.54,2324.02,2321.17,2334.33],
        ['2013/5/30', 2316.25,2317.75,2310.49,2325.72],
        ['2013/5/31', 2320.74,2300.59,2299.37,2325.53],
        ['2013/6/3', 2300.21,2299.25,2294.11,2313.43],
        ['2013/6/4', 2297.1,2272.42,2264.76,2297.1],
        ['2013/6/5', 2270.71,2270.93,2260.87,2276.86],
        ['2013/6/6', 2264.43,2242.11,2240.07,2266.69],
        ['2013/6/7', 2242.26,2210.9,2205.07,2250.63],
        ['2013/6/13', 2190.1,2148.35,2126.22,2190.1]
    ]);
    function splitData(rawData) {
        var categoryData = [];
        var values = []
        for (var i = 0; i < rawData.length; i++) {
            categoryData.push(rawData[i].splice(0, 1)[0]);
            values.push(rawData[i])
        }
        return {
            categoryData: categoryData,
            values: values
        };
    }

    function calculateMA(dayCount) {
        var result = [];
        for (var i = 0, len = data0.values.length; i < len; i++) {
            if (i < dayCount) {
                result.push('-');
                continue;
            }
            var sum = 0;
            for (var j = 0; j < dayCount; j++) {
                sum += data0.values[i - j][1];
            }
            result.push(sum / dayCount);
        }
        return result;
    }
    option = null;
    option = {
        title: {
            text: '易购网商品销量K线图',
            left: 0
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'line'
            }
        },
        legend: {
            data: ['日K', 'MA5', 'MA10', 'MA20', 'MA30']
        },
        grid: {
            left: '10%',
            right: '10%',
            bottom: '15%'
        },
        xAxis: {
            type: 'category',
            data: data0.categoryData,
            scale: true,
            boundaryGap : false,
            axisLine: {onZero: false},//X/Y轴O刻度是否重合
            splitLine: {show: false},//是否显示分割线
            splitNumber: 20,//分割数量
            min: 'dataMin',//坐标轴的最小刻目
            max: 'dataMax'
        },
        yAxis: {
            scale: true,
            splitArea: {
                show: true
            }
        },
        dataZoom: [
            {
                type: 'inside',
                start: 50,
                end: 100
            },
            {
                show: true,
                type: 'slider',
                y: '90%',
                start: 50,
                end: 100
            }
        ],
        series: [
            {
                name: '日K',
                type: 'candlestick',
                data: data0.values,
                markPoint: {
                    label: {//标注文字
                        normal: {
                            formatter: function (param) {
                                return param != null ? Math.round(param.value) : ''; //判断param是不是有值，如果有，返回四舍五入后的值，如果没有就返回空
                            }
                        }
                    },
                    data: [
                        {
                            name: 'XX标点',
                            coord: ['2013/5/31', 2300],
                            value: 2300,
                            itemStyle: {
                                normal: {color: 'rgb(41,60,85)'}
                            }
                        },
                        {
                            name: 'highest value',
                            type: 'max',
                            valueDim: 'highest'
                        },
                        {
                            name: 'lowest value',
                            type: 'min',
                            valueDim: 'lowest'
                        },
                        {
                            name: 'average value on close',
                            type: 'average',
                            valueDim: 'close'
                        }
                    ],
                    tooltip: {
                        formatter: function (param) {
                            return param.name + '<br>' + (param.data.coord || '');
                        }
                    }
                },
                markLine: {
                    symbol: ['none', 'none'],
                    data: [
                        [
                            {
                                name: 'from lowest to highest',
                                type: 'min',
                                valueDim: 'lowest',
                                symbol: 'circle',
                                symbolSize: 10,
                                label: {
                                    normal: {show: false},
                                    emphasis: {show: false}
                                }
                            },
                            {
                                type: 'max',
                                valueDim: 'highest',
                                symbol: 'circle',
                                symbolSize: 10,
                                label: {
                                    normal: {show: false},
                                    emphasis: {show: false}
                                }
                            }
                        ],
                        {
                            name: 'min line on close',
                            type: 'min',
                            valueDim: 'close'
                        },
                        {
                            name: 'max line on close',
                            type: 'max',
                            valueDim: 'close'
                        }
                    ]
                }
            },
            {
                name: 'MA5',
                type: 'line',
                data: calculateMA(5),
                smooth: true,
                lineStyle: {
                    normal: {opacity: 0.5}
                }
            },
            {
                name: 'MA10',
                type: 'line',
                data: calculateMA(10),
                smooth: true,
                lineStyle: {
                    normal: {opacity: 0.5}
                }
            },
            {
                name: 'MA20',
                type: 'line',
                data: calculateMA(20),
                smooth: true,
                lineStyle: {
                    normal: {opacity: 0.5}
                }
            },
            {
                name: 'MA30',
                type: 'line',
                data: calculateMA(30),
                smooth: true,
                lineStyle: {
                    normal: {opacity: 0.5}
                }
            },

        ]
    };
    clearInterval(app.timeTicket);
    app.count = 11;
    app.timeTicket = setInterval(function (){
        axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');

        var data0 = option.series[0].data;
        var data1 = option.series[1].data;
        var data2 = option.series[2].data;
        var data3 = option.series[3].data;
        data0.shift();
        data0.push(2200+Math.random() * 100);
        data1.shift();
        data1.push(2200+Math.random() * 100);
        data2.shift();
        data2.push(2200+Math.random() * 100);
        data3.shift();
        data3.push(2200+Math.random() * 100);


        /*option.xAxis[0].data.shift();
         option.xAxis[0].data.push(axisData);
         option.xAxis[1].data.shift();
         option.xAxis[1].data.push(app.count++);*/

        myChart.setOption(option);
    }, 2000);
    ;
    if (option && typeof option === "object") {
        var startTime = +new Date();
        myChart.setOption(option, true);
        var endTime = +new Date();
        var updateTime = endTime - startTime;
        console.log("Time used:", updateTime);
    }
</script>
</body>
</html>