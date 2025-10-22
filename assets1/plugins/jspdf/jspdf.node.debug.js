'use strict';

/** @license
 *
 * jsPDF - PDF Document creation from JavaScript
 * Version 2.1.1 Built on 2019-10-11T08:56:25.346Z
 *                      CommitID 0dd01f177e
 *
 * Copyright (c) 2010-2025 James Hall <james@parall.ax>, https://github.com/MrRio/jsPDF
 *               2015-2025 yWorks GmbH, https://www.yworks.com
 *               2015-2025 Lukas Holländer <lukas.hollaender@yworks.com>, https://github.com/HackbrettXXX
 *               2016-2025 Aras Abbasi <aras.abbasi@gmail.com>
 *               2010 Aaron Spike, https://github.com/acspike
 *               2012 Willow Systems Corporation, willow-systems.com
 *               2012 Pablo Hess, https://github.com/pablohess
 *               2012 Florian Jenett, https://github.com/fjenett
 *               2013 Warren Weckesser, https://github.com/warrenweckesser
 *               2013 Youssef Beddad, https://github.com/lifof
 *               2013 Lee Driscoll, https://github.com/lsdriscoll
 *               2013 Stefan Slonevskiy, https://github.com/stefslon
 *               2013 Jeremy Morel, https://github.com/jmorel
 *               2013 Christoph Hartmann, https://github.com/chris-rock
 *               2014 Juan Pablo Gaviria, https://github.com/juanpgaviria
 *               2014 James Makes, https://github.com/dollaruw
 *               2014 Diego Casorran, https://github.com/diegocr
 *               2014 Steven Spungin, https://github.com/Flamenco
 *               2014 Kenneth Glassey, https://github.com/Gavvers
 *
 * Licensed under the MIT License
 *
 * Contributor(s):
 *    siefkenj, ahwolf, rickygu, Midnith, saintclair, eaparango,
 *    kim3er, mfo, alnorth, Flamenco
 */

function _typeof(obj) {
  if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") {
    _typeof = function (obj) {
      return typeof obj;
    };
  } else {
    _typeof = function (obj) {
      return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
    };
  }

  return _typeof(obj);
}

/* eslint-disable no-console */

/* global saveAs, define, RGBColor */
// eslint-disable-next-line no-unused-vars
var jsPDF = function (global) {
  /**
   * jsPDF's Internal PubSub Implementation.
   * Backward compatible rewritten on 2014 by
   * Diego Casorran, https://github.com/diegocr
   *
   * @class
   * @name PubSub
   * @ignore
   */

  function PubSub(context) {
    if (_typeof(context) !== "object") {
      throw new Error("Invalid Context passed to initialize PubSub (jsPDF-module)");
    }

    var topics = {};

    this.subscribe = function (topic, callback, once) {
      once = once || false;

      if (typeof topic !== "string" || typeof callback !== "function" || typeof once !== "boolean") {
        throw new Error("Invalid arguments passed to PubSub.subscribe (jsPDF-module)");
      }

      if (!topics.hasOwnProperty(topic)) {
        topics[topic] = {};
      }

      var token = Math.random().toString(35);
      topics[topic][token] = [callback, !!once];
      return token;
    };

    this.unsubscribe = function (token) {
      for (var topic in topics) {
        if (topics[topic][token]) {
          delete topics[topic][token];

          if (Object.keys(topics[topic]).length === 0) {
            delete topics[topic];
          }

          return true;
        }
      }

      return false;
    };

    this.publish = function (topic) {
      if (topics.hasOwnProperty(topic)) {
        var args = Array.prototype.slice.call(arguments, 1),
            tokens = [];

        for (var token in topics[topic]) {
          var sub = topics[topic][token];

          try {
            sub[0].apply(context, args);
          } catch (ex) {
            if (global.console) {
              console.error("jsPDF PubSub Error", ex.message, ex);
            }
          }

          if (sub[1]) { tokens.push(token); }
        }

        if (tokens.length) { tokens.forEach(this.unsubscribe); }
      }
    };

    this.getTopics = function () {
      return topics;
    };
  }
  /**
   * Creates new jsPDF document object instance.
   * @name jsPDF
   * @class
   * @param {Object} [options] - Collection of settings initializing the jsPDF-instance
   * @param {string} [options.orientation=portrait] - Orientation of the first page. Possible values are "portrait" or "landscape" (or shortcuts "p" or "l").<br />
   * @param {string} [options.unit=mm] Measurement unit (base unit) to be used when coordinates are specified.<br />
   * Possible values are "pt" (points), "mm", "cm", "m", "in" or "px".
   * @param {string/Array} [options.format=a4] The format of the first page. Can be:<ul><li>a0 - a10</li><li>b0 - b10</li><li>c0 - c10</li><li>dl</li><li>letter</li><li>government-letter</li><li>legal</li><li>junior-legal</li><li>ledger</li><li>tabloid</li><li>credit-card</li></ul><br />
   * Default is "a4". If you want to use your own format just pass instead of one of the above predefined formats the size as an number-array, e.g. [595.28, 841.89]
   * @param {boolean} [options.putOnlyUsedFonts=false] Only put fonts into the PDF, which were used.
   * @param {boolean} [options.compress=false] Compress the generated PDF.
   * @param {number} [options.precision=16] Precision of the element-positions.
   * @param {number} [options.userUnit=1.0] Not to be confused with the base unit. Please inform yourself before you use it.
   * @param {number|"smart"} [options.floatPrecision=16]
   * @returns {jsPDF} jsPDF-instance
   * @description
   * ```
   * {
   *  orientation: 'p',
   *  unit: 'mm',
   *  format: 'a4',
   *  putOnlyUsedFonts:true,
   *  floatPrecision: 16 // or "smart", default is 16
   * }
   * ```
   *
   * @constructor
   */


  function jsPDF(options) {
    var orientation = typeof arguments[0] === "string" ? arguments[0] : "p";
    var unit = arguments[1];
    var format = arguments[2];
    var compressPdf = arguments[3];
    var filters = [];
    var userUnit = 1.0;
    var precision;
    var floatPrecision = 16;
    var defaultPathOperation = "S";
    options = options || {};

    if (_typeof(options) === "object") {
      orientation = options.orientation;
      unit = options.unit || unit;
      format = options.format || format;
      compressPdf = options.compress || options.compressPdf || compressPdf;
      userUnit = typeof options.userUnit === "number" ? Math.abs(options.userUnit) : 1.0;

      if (typeof options.precision !== "undefined") {
        precision = options.precision;
      }

      if (typeof options.floatPrecision !== "undefined") {
        floatPrecision = options.floatPrecision;
      }

      defaultPathOperation = options.defaultPathOperation || "S";
    }

    filters = options.filters || (compressPdf === true ? ["FlateEncode"] : filters);
    unit = unit || "mm";
    orientation = ("" + (orientation || "P")).toLowerCase();
    var putOnlyUsedFonts = options.putOnlyUsedFonts || false;
    var usedFonts = {};
    var API = {
      internal: {},
      __private__: {}
    };
    API.__private__.PubSub = PubSub;
    var pdfVersion = "1.3";

    var getPdfVersion = API.__private__.getPdfVersion = function () {
      return pdfVersion;
    };

    API.__private__.setPdfVersion = function (value) {
      pdfVersion = value;
    }; // Size in pt of various paper formats


    var pageFormats = {
      a0: [2383.94, 3370.39],
      a1: [1683.78, 2383.94],
      a2: [1190.55, 1683.78],
      a3: [841.89, 1190.55],
      a4: [595.28, 841.89],
      a5: [419.53, 595.28],
      a6: [297.64, 419.53],
      a7: [209.76, 297.64],
      a8: [147.4, 209.76],
      a9: [104.88, 147.4],
      a10: [73.7, 104.88],
      b0: [2834.65, 4008.19],
      b1: [2004.09, 2834.65],
      b2: [1417.32, 2004.09],
      b3: [1000.63, 1417.32],
      b4: [708.66, 1000.63],
      b5: [498.9, 708.66],
      b6: [354.33, 498.9],
      b7: [249.45, 354.33],
      b8: [175.75, 249.45],
      b9: [124.72, 175.75],
      b10: [87.87, 124.72],
      c0: [2599.37, 3676.54],
      c1: [1836.85, 2599.37],
      c2: [1298.27, 1836.85],
      c3: [918.43, 1298.27],
      c4: [649.13, 918.43],
      c5: [459.21, 649.13],
      c6: [323.15, 459.21],
      c7: [229.61, 323.15],
      c8: [161.57, 229.61],
      c9: [113.39, 161.57],
      c10: [79.37, 113.39],
      dl: [311.81, 623.62],
      letter: [612, 792],
      "government-letter": [576, 756],
      legal: [612, 1008],
      "junior-legal": [576, 360],
      ledger: [1224, 792],
      tabloid: [792, 1224],
      "credit-card": [153, 243]
    };

    API.__private__.getPageFormats = function () {
      return pageFormats;
    };

    var getPageFormat = API.__private__.getPageFormat = function (value) {
      return pageFormats[value];
    };

    format = format || "a4";
    var ApiMode = {
      COMPAT: "compat",
      ADVANCED: "advanced"
    };
    var apiMode = ApiMode.COMPAT;

    function advancedAPI() {
      // prepend global change of basis matrix
      // (Now, instead of converting every coordinate to the pdf coordinate system, we apply a matrix
      // that does this job for us (however, texts, images and similar objects must be drawn bottom up))
      this.saveGraphicsState();
      out(new Matrix(scaleFactor, 0, 0, -scaleFactor, 0, getPageHeight() * scaleFactor).toString() + " cm");
      this.setFontSize(this.getFontSize() / scaleFactor); // The default in MrRio's implementation is "S" (stroke), whereas the default in the yWorks implementation
      // was "n" (none). Although this has nothing to do with transforms, we should use the API switch here.

      defaultPathOperation = "n";
      apiMode = ApiMode.ADVANCED;
    }

    function compatAPI() {
      this.restoreGraphicsState();
      defaultPathOperation = "S";
      apiMode = ApiMode.COMPAT;
    }
    /**
     * @callback ApiSwitchBody
     * @param {jsPDF} pdf
     */

    /**
     * For compatibility reasons jsPDF offers two API modes which differ in the way they convert between the the usual
     * screen coordinates and the PDF coordinate system.
     *   - "compat": Offers full compatibility across all plugins but does not allow arbitrary transforms
     *   - "advanced": Allows arbitrary transforms and more advanced features like pattern fills. Some plugins might
     *     not support this mode, though.
     * Initial mode is "compat".
     *
     * You can either provide a callback to the body argument, which means that jsPDF will automatically switch back to
     * the original API mode afterwards; or you can omit the callback and switch back manually using {@link compatAPI}.
     *
     * Note, that the calls to {@link saveGraphicsState} and {@link restoreGraphicsState} need to be balanced within the
     * callback or between calls of this method and its counterpart {@link compatAPI}. Calls to {@link beginFormObject}
     * or {@link beginTilingPattern} need to be closed by their counterparts before switching back to "compat" API mode.
     *
     * @param {ApiSwitchBody=} body When provided, this callback will be called after the API mode has been switched.
     * The API mode will be switched back automatically afterwards.
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name advancedAPI
     */


    API.advancedAPI = function (body) {
      var doSwitch = apiMode === ApiMode.COMPAT;

      if (doSwitch) {
        advancedAPI.call(this);
      }

      if (typeof body !== "function") {
        return this;
      }

      body(this);

      if (doSwitch) {
        compatAPI.call(this);
      }

      return this;
    };
    /**
     * Switches to "compat" API mode. See {@link advancedAPI} for more details.
     *
     * @param {ApiSwitchBody=} body When provided, this callback will be called after the API mode has been switched.
     * The API mode will be switched back automatically afterwards.
     * @return {jsPDF}
     * @memberof jsPDF#
     * @name compatApi
     */


    API.compatAPI = function (body) {
      var doSwitch = apiMode === ApiMode.ADVANCED;

      if (doSwitch) {
        compatAPI.call(this);
      }

      if (typeof body !== "function") {
        return this;
      }

      body(this);

      if (doSwitch) {
        advancedAPI.call(this);
      }

      return this;
    };
    /**
     * @return {boolean} True iff the current API mode is "advanced". See {@link advancedAPI}.
     * @memberof jsPDF#
     * @name isAdvancedAPI
     */


    API.isAdvancedAPI = function () {
      return apiMode === ApiMode.ADVANCED;
    };

    var advancedApiModeTrap = function advancedApiModeTrap(methodName) {
      if (apiMode !== ApiMode.ADVANCED) {
        throw new Error(methodName + " is only available in 'advanced' API mode. " + "You need to call advancedAPI() first.");
      }
    };

    var roundToPrecision = API.roundToPrecision = API.__private__.roundToPrecision = function (number, parmPrecision) {
      var tmpPrecision = precision || parmPrecision;

      if (isNaN(number) || isNaN(tmpPrecision)) {
        throw new Error("Invalid argument passed to jsPDF.roundToPrecision");
      }

      return number.toFixed(tmpPrecision).replace(/0+$/, "");
    }; // high precision float


    var hpf;

    if (typeof floatPrecision === "number") {
      hpf = API.hpf = API.__private__.hpf = function (number) {
        if (isNaN(number)) {
          throw new Error("Invalid argument passed to jsPDF.hpf");
        }

        return roundToPrecision(number, floatPrecision);
      };
    } else if (floatPrecision === "smart") {
      hpf = API.hpf = API.__private__.hpf = function (number) {
        if (isNaN(number)) {
          throw new Error("Invalid argument passed to jsPDF.hpf");
        }

        if (number > -1 && number < 1) {
          return roundToPrecision(number, 16);
        } else {
          return roundToPrecision(number, 5);
        }
      };
    } else {
      hpf = API.hpf = API.__private__.hpf = function (number) {
        if (isNaN(number)) {
          throw new Error("Invalid argument passed to jsPDF.hpf");
        }

        return roundToPrecision(number, 16);
      };
    }

    var f2 = API.f2 = API.__private__.f2 = function (number) {
      if (isNaN(number)) {
        throw new Error("Invalid argument passed to jsPDF.f2");
      }

      return roundToPrecision(number, 2);
    };

    var f3 = API.__private__.f3 = function (number) {
      if (isNaN(number)) {
        throw new Error("Invalid argument passed to jsPDF.f3");
      }

      return roundToPrecision(number, 3);
    };

    var scale = API.scale = API.__private__.scale = function (number) {
      if (isNaN(number)) {
        throw new Error("Invalid argument passed to jsPDF.scale");
      }

      if (apiMode === ApiMode.COMPAT) {
        return number * scaleFactor;
      } else if (apiMode === ApiMode.ADVANCED) {
        return number;
      }
    };

    var transformY = function transformY(y) {
      if (apiMode === ApiMode.COMPAT) {
        return getPageHeight() - y;
      } else if (apiMode === ApiMode.ADVANCED) {
        return y;
      }
    };

    var transformScaleY = function transformScaleY(y) {
      return scale(transformY(y));
    };
    /**
     * @name setPrecision
     * @memberof jsPDF#
     * @function
     * @instance
     * @param {string} precision
     * @returns {jsPDF}
     */


    API.__private__.setPrecision = API.setPrecision = function (value) {
      if (typeof parseInt(value, 10) === "number") {
        precision = parseInt(value, 10);
      }
    };

    var fileId = "00000000000000000000000000000000";

    var getFileId = API.__private__.getFileId = function () {
      return fileId;
    };

    var setFileId = API.__private__.setFileId = function (value) {
      if (typeof value !== "undefined" && /^[a-fA-F0-9]{32}$/.test(value)) {
        fileId = value.toUpperCase();
      } else {
        fileId = fileId.split("").map(function () {
          return "ABCDEF0123456789".charAt(Math.floor(Math.random() * 16));
        }).join("");
      }

      return fileId;
    };
    /**
     * @name setFileId
     * @memberof jsPDF#
     * @function
     * @instance
     * @param {string} value GUID.
     * @returns {jsPDF}
     */


    API.setFileId = function (value) {
      setFileId(value);
      return this;
    };
    /**
     * @name getFileId
     * @memberof jsPDF#
     * @function
     * @instance
     *
     * @returns {string} GUID.
     */


    API.getFileId = function () {
      return getFileId();
    };

    var creationDate;

    var convertDateToPDFDate = API.__private__.convertDateToPDFDate = function (parmDate) {
      var result = "";
      var tzoffset = parmDate.getTimezoneOffset(),
          tzsign = tzoffset < 0 ? "+" : "-",
          tzhour = Math.floor(Math.abs(tzoffset / 60)),
          tzmin = Math.abs(tzoffset % 60),
          timeZoneString = [tzsign, padd2(tzhour), "'", padd2(tzmin), "'"].join("");
      result = ["D:", parmDate.getFullYear(), padd2(parmDate.getMonth() + 1), padd2(parmDate.getDate()), padd2(parmDate.getHours()), padd2(parmDate.getMinutes()), padd2(parmDate.getSeconds()), timeZoneString].join("");
      return result;
    };

    var convertPDFDateToDate = API.__private__.convertPDFDateToDate = function (parmPDFDate) {
      var year = parseInt(parmPDFDate.substr(2, 4), 10);
      var month = parseInt(parmPDFDate.substr(6, 2), 10) - 1;
      var date = parseInt(parmPDFDate.substr(8, 2), 10);
      var hour = parseInt(parmPDFDate.substr(10, 2), 10);
      var minutes = parseInt(parmPDFDate.substr(12, 2), 10);
      var seconds = parseInt(parmPDFDate.substr(14, 2), 10); // var timeZoneHour = parseInt(parmPDFDate.substr(16, 2), 10);
      // var timeZoneMinutes = parseInt(parmPDFDate.substr(20, 2), 10);

      var resultingDate = new Date(year, month, date, hour, minutes, seconds, 0);
      return resultingDate;
    };

    var setCreationDate = API.__private__.setCreationDate = function (date) {
      var tmpCreationDateString;
      var regexPDFCreationDate = /^D:(20[0-2][0-9]|203[0-7]|19[7-9][0-9])(0[0-9]|1[0-2])([0-2][0-9]|3[0-1])(0[0-9]|1[0-9]|2[0-3])(0[0-9]|[1-5][0-9])(0[0-9]|[1-5][0-9])(\+0[0-9]|\+1[0-4]|-0[0-9]|-1[0-1])'(0[0-9]|[1-5][0-9])'?$/;

      if (typeof date === "undefined") {
        date = new Date();
      }

      if (date instanceof Date) {
        tmpCreationDateString = convertDateToPDFDate(date);
      } else if (regexPDFCreationDate.test(date)) {
        tmpCreationDateString = date;
      } else {
        throw new Error("Invalid argument passed to jsPDF.setCreationDate");
      }

      creationDate = tmpCreationDateString;
      return creationDate;
    };

    var getCreationDate = API.__private__.getCreationDate = function (type) {
      var result = creationDate;

      if (type === "jsDate") {
        result = convertPDFDateToDate(creationDate);
      }

      return result;
    };
    /**
     * @name setCreationDate
     * @memberof jsPDF#
     * @function
     * @instance
     * @param {Object} date
     * @returns {jsPDF}
     */


    API.setCreationDate = function (date) {
      setCreationDate(date);
      return this;
    };
    /**
     * @name getCreationDate
     * @memberof jsPDF#
     * @function
     * @instance
     * @param {Object} type
     * @returns {Object}
     */


    API.getCreationDate = function (type) {
      return getCreationDate(type);
    };

    var padd2 = API.__private__.padd2 = function (number) {
      return ("0" + parseInt(number)).slice(-2);
    };

    var padd2Hex = API.__private__.padd2Hex = function (hexString) {
      hexString = hexString.toString();
      return ("00" + hexString).substr(hexString.length);
    };

    var objectNumber = 0; // 'n' Current object number

    var offsets = []; // List of offsets. Activated and reset by buildDocument(). Pupulated by various calls buildDocument makes.

    var content = [];
    var contentLength = 0;
    var additionalObjects = [];
    var pages = [];
    var currentPage;
    var hasCustomDestination = false;
    var outputDestination = content;

    var resetDocument = function resetDocument() {
      //reset fields relevant for objectNumber generation and xref.
      objectNumber = 0;
      contentLength = 0;
      content = [];
      offsets = [];
      additionalObjects = [];
      rootDictionaryObjId = newObjectDeferred();
      resourceDictionaryObjId = newObjectDeferred();
    };

    API.__private__.setCustomOutputDestination = function (destination) {
      hasCustomDestination = true;
      outputDestination = destination;
    };

    var setOutputDestination = function setOutputDestination(destination) {
      if (!hasCustomDestination) {
        outputDestination = destination;
      }
    };

    API.__private__.resetCustomOutputDestination = function () {
      hasCustomDestination = false;
      outputDestination = content;
    };

    var out = API.__private__.out = function (string) {
      string = string.toString();
      contentLength += string.length + 1;
      outputDestination.push(string);
      return outputDestination;
    };

    var write = API.__private__.write = function (value) {
      return out(arguments.length === 1 ? value.toString() : Array.prototype.join.call(arguments, " "));
    };

    var getArrayBuffer = API.__private__.getArrayBuffer = function (data) {
      var len = data.length,
          ab = new ArrayBuffer(len),
          u8 = new Uint8Array(ab);

      while (len--) {
        u8[len] = data.charCodeAt(len);
      }

      return ab;
    };

    var standardFonts = [["Helvetica", "helvetica", "normal", "WinAnsiEncoding"], ["Helvetica-Bold", "helvetica", "bold", "WinAnsiEncoding"], ["Helvetica-Oblique", "helvetica", "italic", "WinAnsiEncoding"], ["Helvetica-BoldOblique", "helvetica", "bolditalic", "WinAnsiEncoding"], ["Courier", "courier", "normal", "WinAnsiEncoding"], ["Courier-Bold", "courier", "bold", "WinAnsiEncoding"], ["Courier-Oblique", "courier", "italic", "WinAnsiEncoding"], ["Courier-BoldOblique", "courier", "bolditalic", "WinAnsiEncoding"], ["Times-Roman", "times", "normal", "WinAnsiEncoding"], ["Times-Bold", "times", "bold", "WinAnsiEncoding"], ["Times-Italic", "times", "italic", "WinAnsiEncoding"], ["Times-BoldItalic", "times", "bolditalic", "WinAnsiEncoding"], ["ZapfDingbats", "zapfdingbats", "normal", null], ["Symbol", "symbol", "normal", null]];

    API.__private__.getStandardFonts = function () {
      return standardFonts;
    };

    var activeFontSize = options.fontSize || 16;
    /**
     * Sets font size for upcoming text elements.
     *
     * @param {number} size Font size in points.
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setFontSize
     */

    API.__private__.setFontSize = API.setFontSize = function (size) {
      if (apiMode === ApiMode.ADVANCED) {
        activeFontSize = size / scaleFactor;
      } else {
        activeFontSize = size;
      }

      return this;
    };
    /**
     * Gets the fontsize for upcoming text elements.
     *
     * @function
     * @instance
     * @returns {number}
     * @memberof jsPDF#
     * @name getFontSize
     */


    var getFontSize = API.__private__.getFontSize = API.getFontSize = function () {
      if (apiMode === ApiMode.COMPAT) {
        return activeFontSize;
      } else {
        return activeFontSize * scaleFactor;
      }
    };

    var R2L = options.R2L || false;
    /**
     * Set value of R2L functionality.
     *
     * @param {boolean} value
     * @function
     * @instance
     * @returns {jsPDF} jsPDF-instance
     * @memberof jsPDF#
     * @name setR2L
     */

    API.__private__.setR2L = API.setR2L = function (value) {
      R2L = value;
      return this;
    };
    /**
     * Get value of R2L functionality.
     *
     * @function
     * @instance
     * @returns {boolean} jsPDF-instance
     * @memberof jsPDF#
     * @name getR2L
     */


    API.__private__.getR2L = API.getR2L = function () {
      return R2L;
    };

    var zoomMode; // default: 1;

    var setZoomMode = API.__private__.setZoomMode = function (zoom) {
      var validZoomModes = [undefined, null, "fullwidth", "fullheight", "fullpage", "original"];

      if (/^\d*\.?\d*%$/.test(zoom)) {
        zoomMode = zoom;
      } else if (!isNaN(zoom)) {
        zoomMode = parseInt(zoom, 10);
      } else if (validZoomModes.indexOf(zoom) !== -1) {
        zoomMode = zoom;
      } else {
        throw new Error('zoom must be Integer (e.g. 2), a percentage Value (e.g. 300%) or fullwidth, fullheight, fullpage, original. "' + zoom + '" is not recognized.');
      }
    };

    API.__private__.getZoomMode = function () {
      return zoomMode;
    };

    var pageMode; // default: 'UseOutlines';

    var setPageMode = API.__private__.setPageMode = function (pmode) {
      var validPageModes = [undefined, null, "UseNone", "UseOutlines", "UseThumbs", "FullScreen"];

      if (validPageModes.indexOf(pmode) == -1) {
        throw new Error('Page mode must be one of UseNone, UseOutlines, UseThumbs, or FullScreen. "' + pmode + '" is not recognized.');
      }

      pageMode = pmode;
    };

    API.__private__.getPageMode = function () {
      return pageMode;
    };

    var layoutMode; // default: 'continuous';

    var setLayoutMode = API.__private__.setLayoutMode = function (layout) {
      var validLayoutModes = [undefined, null, "continuous", "single", "twoleft", "tworight", "two"];

      if (validLayoutModes.indexOf(layout) == -1) {
        throw new Error('Layout mode must be one of continuous, single, twoleft, tworight. "' + layout + '" is not recognized.');
      }

      layoutMode = layout;
    };

    API.__private__.getLayoutMode = function () {
      return layoutMode;
    };
    /**
     * Set the display mode options of the page like zoom and layout.
     *
     * @name setDisplayMode
     * @memberof jsPDF#
     * @function
     * @instance
     * @param {integer|String} zoom   You can pass an integer or percentage as
     * a string. 2 will scale the document up 2x, '200%' will scale up by the
     * same amount. You can also set it to 'fullwidth', 'fullheight',
     * 'fullpage', or 'original'.
     *
     * Only certain PDF readers support this, such as Adobe Acrobat.
     *
     * @param {string} layout Layout mode can be: 'continuous' - this is the
     * default continuous scroll. 'single' - the single page mode only shows one
     * page at a time. 'twoleft' - two column left mode, first page starts on
     * the left, and 'tworight' - pages are laid out in two columns, with the
     * first page on the right. This would be used for books.
     * @param {string} pmode 'UseOutlines' - it shows the
     * outline of the document on the left. 'UseThumbs' - shows thumbnails along
     * the left. 'FullScreen' - prompts the user to enter fullscreen mode.
     *
     * @returns {jsPDF}
     */


    API.__private__.setDisplayMode = API.setDisplayMode = function (zoom, layout, pmode) {
      setZoomMode(zoom);
      setLayoutMode(layout);
      setPageMode(pmode);
      return this;
    };

    var documentProperties = {
      title: "",
      subject: "",
      author: "",
      keywords: "",
      creator: ""
    };

    API.__private__.getDocumentProperty = function (key) {
      if (Object.keys(documentProperties).indexOf(key) === -1) {
        throw new Error("Invalid argument passed to jsPDF.getDocumentProperty");
      }

      return documentProperties[key];
    };

    API.__private__.getDocumentProperties = function () {
      return documentProperties;
    };
    /**
     * Adds a properties to the PDF document.
     *
     * @param {Object} A property_name-to-property_value object structure.
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setDocumentProperties
     */


    API.__private__.setDocumentProperties = API.setProperties = API.setDocumentProperties = function (properties) {
      // copying only those properties we can render.
      for (var property in documentProperties) {
        if (documentProperties.hasOwnProperty(property) && properties[property]) {
          documentProperties[property] = properties[property];
        }
      }

      return this;
    };

    API.__private__.setDocumentProperty = function (key, value) {
      if (Object.keys(documentProperties).indexOf(key) === -1) {
        throw new Error("Invalid arguments passed to jsPDF.setDocumentProperty");
      }

      return documentProperties[key] = value;
    };

    var fonts = {}; // collection of font objects, where key is fontKey - a dynamically created label for a given font.

    var fontmap = {}; // mapping structure fontName > fontStyle > font key - performance layer. See addFont()

    var activeFontKey; // will be string representing the KEY of the font as combination of fontName + fontStyle

    var fontStateStack = []; //

    var patterns = {}; // collection of pattern objects

    var patternMap = {}; // see fonts

    var gStates = {}; // collection of graphic state objects

    var gStatesMap = {}; // see fonts

    var activeGState = null;
    var scaleFactor; // Scale factor

    var page = 0;
    var pagesContext = [];
    var events = new PubSub(API);
    var hotfixes = options.hotfixes || [];
    var renderTargets = {};
    var renderTargetMap = {};
    var renderTargetStack = [];
    var pageX;
    var pageY;
    var pageMatrix; // only used for FormObjects

    /**
     * A matrix object for 2D homogenous transformations: <br>
     * | a b 0 | <br>
     * | c d 0 | <br>
     * | e f 1 | <br>
     * pdf multiplies matrices righthand: v' = v x m1 x m2 x ...
     *
     * @class
     * @name Matrix
     * @param {number} sx
     * @param {number} shy
     * @param {number} shx
     * @param {number} sy
     * @param {number} tx
     * @param {number} ty
     * @constructor
     */

    var Matrix = function Matrix(sx, shy, shx, sy, tx, ty) {
      var _matrix = [];
      /**
       * @name sx
       * @memberof Matrix#
       */

      Object.defineProperty(this, "sx", {
        get: function get() {
          return _matrix[0];
        },
        set: function set(value) {
          _matrix[0] = value;
        }
      });
      /**
       * @name shy
       * @memberof Matrix#
       */

      Object.defineProperty(this, "shy", {
        get: function get() {
          return _matrix[1];
        },
        set: function set(value) {
          _matrix[1] = value;
        }
      });
      /**
       * @name shx
       * @memberof Matrix#
       */

      Object.defineProperty(this, "shx", {
        get: function get() {
          return _matrix[2];
        },
        set: function set(value) {
          _matrix[2] = value;
        }
      });
      /**
       * @name sy
       * @memberof Matrix#
       */

      Object.defineProperty(this, "sy", {
        get: function get() {
          return _matrix[3];
        },
        set: function set(value) {
          _matrix[3] = value;
        }
      });
      /**
       * @name tx
       * @memberof Matrix#
       */

      Object.defineProperty(this, "tx", {
        get: function get() {
          return _matrix[4];
        },
        set: function set(value) {
          _matrix[4] = value;
        }
      });
      /**
       * @name ty
       * @memberof Matrix#
       */

      Object.defineProperty(this, "ty", {
        get: function get() {
          return _matrix[5];
        },
        set: function set(value) {
          _matrix[5] = value;
        }
      });
      Object.defineProperty(this, "a", {
        get: function get() {
          return _matrix[0];
        },
        set: function set(value) {
          _matrix[0] = value;
        }
      });
      Object.defineProperty(this, "b", {
        get: function get() {
          return _matrix[1];
        },
        set: function set(value) {
          _matrix[1] = value;
        }
      });
      Object.defineProperty(this, "c", {
        get: function get() {
          return _matrix[2];
        },
        set: function set(value) {
          _matrix[2] = value;
        }
      });
      Object.defineProperty(this, "d", {
        get: function get() {
          return _matrix[3];
        },
        set: function set(value) {
          _matrix[3] = value;
        }
      });
      Object.defineProperty(this, "e", {
        get: function get() {
          return _matrix[4];
        },
        set: function set(value) {
          _matrix[4] = value;
        }
      });
      Object.defineProperty(this, "f", {
        get: function get() {
          return _matrix[5];
        },
        set: function set(value) {
          _matrix[5] = value;
        }
      });
      /**
       * @name rotation
       * @memberof Matrix#
       */

      Object.defineProperty(this, "rotation", {
        get: function get() {
          return Math.atan2(this.shx, this.sx);
        }
      });
      /**
       * @name scaleX
       * @memberof Matrix#
       */

      Object.defineProperty(this, "scaleX", {
        get: function get() {
          return this.decompose().scale.sx;
        }
      });
      /**
       * @name scaleY
       * @memberof Matrix#
       */

      Object.defineProperty(this, "scaleY", {
        get: function get() {
          return this.decompose().scale.sy;
        }
      });
      /**
       * @name isIdentity
       * @memberof Matrix#
       */

      Object.defineProperty(this, "isIdentity", {
        get: function get() {
          if (this.sx !== 1) {
            return false;
          }

          if (this.shy !== 0) {
            return false;
          }

          if (this.shx !== 0) {
            return false;
          }

          if (this.sy !== 1) {
            return false;
          }

          if (this.tx !== 0) {
            return false;
          }

          if (this.ty !== 0) {
            return false;
          }

          return true;
        }
      });
      this.sx = !isNaN(sx) ? sx : 1;
      this.shy = !isNaN(shy) ? shy : 0;
      this.shx = !isNaN(shx) ? shx : 0;
      this.sy = !isNaN(sy) ? sy : 1;
      this.tx = !isNaN(tx) ? tx : 0;
      this.ty = !isNaN(ty) ? ty : 0;
      return this;
    };
    /**
     * Join the Matrix Values to a String
     *
     * @function join
     * @param {string} separator Specifies a string to separate each pair of adjacent elements of the array. The separator is converted to a string if necessary. If omitted, the array elements are separated with a comma (","). If separator is an empty string, all elements are joined without any characters in between them.
     * @returns {string} A string with all array elements joined.
     * @memberof Matrix#
     */


    Matrix.prototype.join = function (separator) {
      return [this.sx, this.shy, this.shx, this.sy, this.tx, this.ty].map(hpf).join(separator);
    };
    /**
     * Multiply the matrix with given Matrix
     *
     * @function multiply
     * @param matrix
     * @returns {Matrix}
     * @memberof Matrix#
     */


    Matrix.prototype.multiply = function (matrix) {
      var sx = matrix.sx * this.sx + matrix.shy * this.shx;
      var shy = matrix.sx * this.shy + matrix.shy * this.sy;
      var shx = matrix.shx * this.sx + matrix.sy * this.shx;
      var sy = matrix.shx * this.shy + matrix.sy * this.sy;
      var tx = matrix.tx * this.sx + matrix.ty * this.shx + this.tx;
      var ty = matrix.tx * this.shy + matrix.ty * this.sy + this.ty;
      return new Matrix(sx, shy, shx, sy, tx, ty);
    };
    /**
     * @function decompose
     * @memberof Matrix#
     */


    Matrix.prototype.decompose = function () {
      var a = this.sx;
      var b = this.shy;
      var c = this.shx;
      var d = this.sy;
      var e = this.tx;
      var f = this.ty;
      var scaleX = Math.sqrt(a * a + b * b);
      a /= scaleX;
      b /= scaleX;
      var shear = a * c + b * d;
      c -= a * shear;
      d -= b * shear;
      var scaleY = Math.sqrt(c * c + d * d);
      c /= scaleY;
      d /= scaleY;
      shear /= scaleY;

      if (a * d < b * c) {
        a = -a;
        b = -b;
        shear = -shear;
        scaleX = -scaleX;
      }

      return {
        scale: new Matrix(scaleX, 0, 0, scaleY, 0, 0),
        translate: new Matrix(1, 0, 0, 1, e, f),
        rotate: new Matrix(a, b, -b, a, 0, 0),
        skew: new Matrix(1, 0, shear, 1, 0, 0)
      };
    };
    /**
     * @function toString
     * @memberof Matrix#
     */


    Matrix.prototype.toString = function (parmPrecision) {
      return this.join(" ");
    };
    /**
     * @function inversed
     * @memberof Matrix#
     */


    Matrix.prototype.inversed = function () {
      var a = this.sx,
          b = this.shy,
          c = this.shx,
          d = this.sy,
          e = this.tx,
          f = this.ty;
      var quot = 1 / (a * d - b * c);
      var aInv = d * quot;
      var bInv = -b * quot;
      var cInv = -c * quot;
      var dInv = a * quot;
      var eInv = -aInv * e - cInv * f;
      var fInv = -bInv * e - dInv * f;
      return new Matrix(aInv, bInv, cInv, dInv, eInv, fInv);
    };
    /**
     * @function applyToPoint
     * @memberof Matrix#
     */


    Matrix.prototype.applyToPoint = function (pt) {
      var x = pt.x * this.sx + pt.y * this.shx + this.tx;
      var y = pt.x * this.shy + pt.y * this.sy + this.ty;
      return new Point(x, y);
    };
    /**
     * @function applyToRectangle
     * @memberof Matrix#
     */


    Matrix.prototype.applyToRectangle = function (rect) {
      var pt1 = this.applyToPoint(rect);
      var pt2 = this.applyToPoint(new Point(rect.x + rect.w, rect.y + rect.h));
      return new Rectangle(pt1.x, pt1.y, pt2.x - pt1.x, pt2.y - pt1.y);
    };
    /**
     * Clone the Matrix
     *
     * @function clone
     * @memberof Matrix#
     * @name clone
     * @instance
     */


    Matrix.prototype.clone = function () {
      var sx = this.sx;
      var shy = this.shy;
      var shx = this.shx;
      var sy = this.sy;
      var tx = this.tx;
      var ty = this.ty;
      return new Matrix(sx, shy, shx, sy, tx, ty);
    };

    API.Matrix = Matrix;
    /**
     * Multiplies two matrices. (see {@link Matrix})
     * @param {Matrix} m1
     * @param {Matrix} m2
     * @memberof jsPDF#
     * @name matrixMult
     */

    var matrixMult = API.matrixMult = function (m1, m2) {
      return m2.multiply(m1);
    };
    /**
     * The identity matrix (equivalent to new Matrix(1, 0, 0, 1, 0, 0)).
     * @type {Matrix}
     * @memberof! jsPDF#
     * @name identityMatrix
     */


    var identityMatrix = new Matrix(1, 0, 0, 1, 0, 0);
    API.unitMatrix = API.identityMatrix = identityMatrix;

    var Pattern = function Pattern(gState, matrix) {
      this.gState = gState;
      this.matrix = matrix;
      this.id = ""; // set by addPattern()

      this.objectNumber = -1; // will be set by putPattern()
    };
    /**
     * Adds a new pattern for later use.
     * @param {String} key The key by it can be referenced later. The keys must be unique!
     * @param {API.Pattern} pattern The pattern
     */


    var addPattern = function addPattern(key, pattern) {
      // only add it if it is not already present (the keys provided by the user must be unique!)
      if (patternMap[key]) { return; }
      var prefix = pattern instanceof API.ShadingPattern ? "Sh" : "P";
      var patternKey = prefix + (Object.keys(patterns).length + 1).toString(10);
      pattern.id = patternKey;
      patternMap[key] = patternKey;
      patterns[patternKey] = pattern;
      events.publish("addPattern", pattern);
    };
    /**
     * A pattern describing a shading pattern.
     *
     * Only available in "advanced" API mode.
     *
     * @param {String} type One of "axial" or "radial"
     * @param {Array<Number>} coords Either [x1, y1, x2, y2] for "axial" type describing the two interpolation points
     * or [x1, y1, r, x2, y2, r2] for "radial" describing inner and the outer circle.
     * @param {Array<Object>} colors An array of objects with the fields "offset" and "color". "offset" describes
     * the offset in parameter space [0, 1]. "color" is an array of length 3 describing RGB values in [0, 255].
     * @param {GState=} gState An additional graphics state that gets applied to the pattern (optional).
     * @param {Matrix=} matrix A matrix that describes the transformation between the pattern coordinate system
     * and the use coordinate system (optional).
     * @constructor
     * @extends API.Pattern
     */


    API.ShadingPattern = function (type, coords, colors, gState, matrix) {
      advancedApiModeTrap("ShadingPattern"); // see putPattern() for information how they are realized

      this.type = type === "axial" ? 2 : 3;
      this.coords = coords;
      this.colors = colors;
      Pattern.call(this, gState, matrix);
    };
    /**
     * A PDF Tiling pattern.
     *
     * Only available in "advanced" API mode.
     *
     * @param {Array.<Number>} boundingBox The bounding box at which one pattern cell gets clipped.
     * @param {Number} xStep Horizontal spacing between pattern cells.
     * @param {Number} yStep Vertical spacing between pattern cells.
     * @param {API.GState=} gState An additional graphics state that gets applied to the pattern (optional).
     * @param {Matrix=} matrix A matrix that describes the transformation between the pattern coordinate system
     * and the use coordinate system (optional).
     * @constructor
     * @extends API.Pattern
     */


    API.TilingPattern = function (boundingBox, xStep, yStep, gState, matrix) {
      advancedApiModeTrap("TilingPattern");
      this.boundingBox = boundingBox;
      this.xStep = xStep;
      this.yStep = yStep;
      this.stream = ""; // set by endTilingPattern();

      this.cloneIndex = 0;
      Pattern.call(this, gState, matrix);
    };

    API.TilingPattern.prototype = {
      createClone: function createClone(patternKey, boundingBox, xStep, yStep, matrix) {
        var clone = new API.TilingPattern(boundingBox || this.boundingBox, xStep || this.xStep, yStep || this.yStep, this.gState, matrix || this.matrix);
        clone.stream = this.stream;
        var key = patternKey + "$$" + this.cloneIndex++ + "$$";
        addPattern(key, clone);
        return clone;
      }
    };
    /**
     * Adds a new {@link API.ShadingPattern} for later use. Only available in "advanced" API mode.
     * @param {String} key
     * @param {Pattern} pattern
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name addPattern
     */

    API.addShadingPattern = function (key, pattern) {
      advancedApiModeTrap("addShadingPattern()");
      addPattern(key, pattern);
      return this;
    };
    /**
     * Begins a new tiling pattern. All subsequent render calls are drawn to this pattern until {@link API.endTilingPattern}
     * gets called. Only available in "advanced" API mode.
     * @param {API.Pattern} pattern
     * @memberof jsPDF#
     * @name beginTilingPattern
     */


    API.beginTilingPattern = function (pattern) {
      advancedApiModeTrap("beginTilingPattern()");
      beginNewRenderTarget(pattern.boundingBox[0], pattern.boundingBox[1], pattern.boundingBox[2] - pattern.boundingBox[0], pattern.boundingBox[3] - pattern.boundingBox[1], pattern.matrix);
    };
    /**
     * Ends a tiling pattern and sets the render target to the one active before {@link API.beginTilingPattern} has been called.
     *
     * Only available in "advanced" API mode.
     *
     * @param {string} key A unique key that is used to reference this pattern at later use.
     * @param {API.Pattern} pattern The pattern to end.
     * @memberof jsPDF#
     * @name endTilingPattern
     */


    API.endTilingPattern = function (key, pattern) {
      advancedApiModeTrap("endTilingPattern()"); // retrieve the stream

      pattern.stream = pages[currentPage].join("\n");
      addPattern(key, pattern);
      events.publish("endTilingPattern", pattern); // restore state from stack

      renderTargetStack.pop().restore();
    };

    var newObject = API.__private__.newObject = function () {
      var oid = newObjectDeferred();
      newObjectDeferredBegin(oid, true);
      return oid;
    }; // Does not output the object.  The caller must call newObjectDeferredBegin(oid) before outputing any data


    var newObjectDeferred = API.__private__.newObjectDeferred = function () {
      objectNumber++;

      offsets[objectNumber] = function () {
        return contentLength;
      };

      return objectNumber;
    };

    var newObjectDeferredBegin = function newObjectDeferredBegin(oid, doOutput) {
      doOutput = typeof doOutput === "boolean" ? doOutput : false;
      offsets[oid] = contentLength;

      if (doOutput) {
        out(oid + " 0 obj");
      }

      return oid;
    }; // Does not output the object until after the pages have been output.
    // Returns an object containing the objectId and content.
    // All pages have been added so the object ID can be estimated to start right after.
    // This does not modify the current objectNumber;  It must be updated after the newObjects are output.


    var newAdditionalObject = API.__private__.newAdditionalObject = function () {
      var objId = newObjectDeferred();
      var obj = {
        objId: objId,
        content: ""
      };
      additionalObjects.push(obj);
      return obj;
    };

    var rootDictionaryObjId = newObjectDeferred();
    var resourceDictionaryObjId = newObjectDeferred(); /////////////////////
    // Private functions
    /////////////////////

    var decodeColorString = API.__private__.decodeColorString = function (color) {
      var colorEncoded = color.split(" ");

      if (colorEncoded.length === 2 && (colorEncoded[1] === "g" || colorEncoded[1] === "G")) {
        // convert grayscale value to rgb so that it can be converted to hex for consistency
        var floatVal = parseFloat(colorEncoded[0]);
        colorEncoded = [floatVal, floatVal, floatVal, "r"];
      } else if (colorEncoded.length === 5 && (colorEncoded[4] === "k" || colorEncoded[4] === "K")) {
        // convert CMYK values to rbg so that it can be converted to hex for consistency
        var red = (1.0 - colorEncoded[0]) * (1.0 - colorEncoded[3]);
        var green = (1.0 - colorEncoded[1]) * (1.0 - colorEncoded[3]);
        var blue = (1.0 - colorEncoded[2]) * (1.0 - colorEncoded[3]);
        colorEncoded = [red, green, blue, "r"];
      }

      var colorAsRGB = "#";

      for (var i = 0; i < 3; i++) {
        colorAsRGB += ("0" + Math.floor(parseFloat(colorEncoded[i]) * 255).toString(16)).slice(-2);
      }

      return colorAsRGB;
    };

    var encodeColorString = API.__private__.encodeColorString = function (options) {
      var color;

      if (typeof options === "string") {
        options = {
          ch1: options
        };
      }

      var ch1 = options.ch1;
      var ch2 = options.ch2;
      var ch3 = options.ch3;
      var ch4 = options.ch4;
      var letterArray = options.pdfColorType === "draw" ? ["G", "RG", "K"] : ["g", "rg", "k"];

      if (typeof ch1 === "string" && ch1.charAt(0) !== "#") {
        var rgbColor = new RGBColor(ch1);

        if (rgbColor.ok) {
          ch1 = rgbColor.toHex();
        } else if (!/^\d*\.?\d*$/.test(ch1)) {
          throw new Error('Invalid color "' + ch1 + '" passed to jsPDF.encodeColorString.');
        }
      } //convert short rgb to long form


      if (typeof ch1 === "string" && /^#[0-9A-Fa-f]{3}$/.test(ch1)) {
        ch1 = "#" + ch1[1] + ch1[1] + ch1[2] + ch1[2] + ch1[3] + ch1[3];
      }

      if (typeof ch1 === "string" && /^#[0-9A-Fa-f]{6}$/.test(ch1)) {
        var hex = parseInt(ch1.substr(1), 16);
        ch1 = hex >> 16 & 255;
        ch2 = hex >> 8 & 255;
        ch3 = hex & 255;
      }

      if (typeof ch2 === "undefined" || typeof ch4 === "undefined" && ch1 === ch2 && ch2 === ch3) {
        // Gray color space.
        if (typeof ch1 === "string") {
          color = ch1 + " " + letterArray[0];
        } else {
          switch (options.precision) {
            case 2:
              color = f2(ch1 / 255) + " " + letterArray[0];
              break;

            case 3:
            default:
              color = f3(ch1 / 255) + " " + letterArray[0];
          }
        }
      } else if (typeof ch4 === "undefined" || _typeof(ch4) === "object") {
        // assume RGBA
        if (ch4 && !isNaN(ch4.a)) {
          //TODO Implement transparency.
          //WORKAROUND use white for now, if transparent, otherwise handle as rgb
          if (ch4.a === 0) {
            color = ["1.", "1.", "1.", letterArray[1]].join(" ");
            return color;
          }
        } // assume RGB


        if (typeof ch1 === "string") {
          color = [ch1, ch2, ch3, letterArray[1]].join(" ");
        } else {
          switch (options.precision) {
            case 2:
              color = [f2(ch1 / 255), f2(ch2 / 255), f2(ch3 / 255), letterArray[1]].join(" ");
              break;

            default:
            case 3:
              color = [f3(ch1 / 255), f3(ch2 / 255), f3(ch3 / 255), letterArray[1]].join(" ");
          }
        }
      } else {
        // assume CMYK
        if (typeof ch1 === "string") {
          color = [ch1, ch2, ch3, ch4, letterArray[2]].join(" ");
        } else {
          switch (options.precision) {
            case 2:
              color = [f2(ch1), f2(ch2), f2(ch3), f2(ch4), letterArray[2]].join(" ");
              break;

            case 3:
            default:
              color = [f3(ch1), f3(ch2), f3(ch3), f3(ch4), letterArray[2]].join(" ");
          }
        }
      }

      return color;
    };

    var getFilters = API.__private__.getFilters = function () {
      return filters;
    };

    var putStream = API.__private__.putStream = function (options) {
      options = options || {};
      var data = options.data || "";
      var filters = options.filters || getFilters();
      var alreadyAppliedFilters = options.alreadyAppliedFilters || [];
      var addLength1 = options.addLength1 || false;
      var valueOfLength1 = data.length;
      var processedData = {};

      if (filters === true) {
        filters = ["FlateEncode"];
      }

      var keyValues = options.additionalKeyValues || [];

      if (typeof jsPDF.API.processDataByFilters !== "undefined") {
        processedData = jsPDF.API.processDataByFilters(data, filters);
      } else {
        processedData = {
          data: data,
          reverseChain: []
        };
      }

      var filterAsString = processedData.reverseChain + (Array.isArray(alreadyAppliedFilters) ? alreadyAppliedFilters.join(" ") : alreadyAppliedFilters.toString());

      if (processedData.data.length !== 0) {
        keyValues.push({
          key: "Length",
          value: processedData.data.length
        });

        if (addLength1 === true) {
          keyValues.push({
            key: "Length1",
            value: valueOfLength1
          });
        }
      }

      if (filterAsString.length != 0) {
        if (filterAsString.split("/").length - 1 === 1) {
          keyValues.push({
            key: "Filter",
            value: filterAsString
          });
        } else {
          keyValues.push({
            key: "Filter",
            value: "[" + filterAsString + "]"
          });

          for (var j = 0; j < keyValues.length; j += 1) {
            if (keyValues[j].key === "DecodeParms") {
              var decodeParmsArray = [];

              for (var i = 0; i < processedData.reverseChain.split("/").length - 1; i += 1) {
                decodeParmsArray.push("null");
              }

              decodeParmsArray.push(keyValues[j].value);
              keyValues[j].value = "[" + decodeParmsArray.join(" ") + "]";
            }
          }
        }
      }

      out("<<");

      for (var k = 0; k < keyValues.length; k++) {
        out("/" + keyValues[k].key + " " + keyValues[k].value);
      }

      out(">>");

      if (processedData.data.length !== 0) {
        out("stream");
        out(processedData.data);
        out("endstream");
      }
    };

    var putPage = API.__private__.putPage = function (page) {
      var pageNumber = page.number;
      var data = page.data;
      var pageObjectNumber = page.objId;
      var pageContentsObjId = page.contentsObjId;
      newObjectDeferredBegin(pageObjectNumber, true);
      out("<</Type /Page");
      out("/Parent " + page.rootDictionaryObjId + " 0 R");
      out("/Resources " + page.resourceDictionaryObjId + " 0 R");
      out("/MediaBox [" + parseFloat(hpf(page.mediaBox.bottomLeftX)) + " " + parseFloat(hpf(page.mediaBox.bottomLeftY)) + " " + hpf(page.mediaBox.topRightX) + " " + hpf(page.mediaBox.topRightY) + "]");

      if (page.cropBox !== null) {
        out("/CropBox [" + hpf(page.cropBox.bottomLeftX) + " " + hpf(page.cropBox.bottomLeftY) + " " + hpf(page.cropBox.topRightX) + " " + hpf(page.cropBox.topRightY) + "]");
      }

      if (page.bleedBox !== null) {
        out("/BleedBox [" + hpf(page.bleedBox.bottomLeftX) + " " + hpf(page.bleedBox.bottomLeftY) + " " + hpf(page.bleedBox.topRightX) + " " + hpf(page.bleedBox.topRightY) + "]");
      }

      if (page.trimBox !== null) {
        out("/TrimBox [" + hpf(page.trimBox.bottomLeftX) + " " + hpf(page.trimBox.bottomLeftY) + " " + hpf(page.trimBox.topRightX) + " " + hpf(page.trimBox.topRightY) + "]");
      }

      if (page.artBox !== null) {
        out("/ArtBox [" + hpf(page.artBox.bottomLeftX) + " " + hpf(page.artBox.bottomLeftY) + " " + hpf(page.artBox.topRightX) + " " + hpf(page.artBox.topRightY) + "]");
      }

      if (typeof page.userUnit === "number" && page.userUnit !== 1.0) {
        out("/UserUnit " + page.userUnit);
      }

      events.publish("putPage", {
        objId: pageObjectNumber,
        pageContext: pagesContext[pageNumber],
        pageNumber: pageNumber,
        page: data
      });
      out("/Contents " + pageContentsObjId + " 0 R");
      out(">>");
      out("endobj"); // Page content

      var pageContent = data.join("\n");

      if (apiMode === ApiMode.ADVANCED) {
        // if the user forgot to switch back to COMPAT mode, we must balance the graphics stack again
        pageContent += "\nQ";
      }

      newObjectDeferredBegin(pageContentsObjId, true);
      putStream({
        data: pageContent,
        filters: getFilters()
      });
      out("endobj");
      return pageObjectNumber;
    };

    var putPages = API.__private__.putPages = function () {
      var n,
          i,
          pageObjectNumbers = [];

      for (n = 1; n <= page; n++) {
        pagesContext[n].objId = newObjectDeferred();
        pagesContext[n].contentsObjId = newObjectDeferred();
      }

      for (n = 1; n <= page; n++) {
        pageObjectNumbers.push(putPage({
          number: n,
          data: pages[n],
          objId: pagesContext[n].objId,
          contentsObjId: pagesContext[n].contentsObjId,
          mediaBox: pagesContext[n].mediaBox,
          cropBox: pagesContext[n].cropBox,
          bleedBox: pagesContext[n].bleedBox,
          trimBox: pagesContext[n].trimBox,
          artBox: pagesContext[n].artBox,
          userUnit: pagesContext[n].userUnit,
          rootDictionaryObjId: rootDictionaryObjId,
          resourceDictionaryObjId: resourceDictionaryObjId
        }));
      }

      newObjectDeferredBegin(rootDictionaryObjId, true);
      out("<</Type /Pages");
      var kids = "/Kids [";

      for (i = 0; i < page; i++) {
        kids += pageObjectNumbers[i] + " 0 R ";
      }

      out(kids + "]");
      out("/Count " + page);
      out(">>");
      out("endobj");
      events.publish("postPutPages");
    };

    var putFont = function putFont(font) {
      var pdfEscapeWithNeededParanthesis = function pdfEscapeWithNeededParanthesis(text, flags) {
        var addParanthesis = text.indexOf(" ") !== -1;
        return addParanthesis ? "(" + pdfEscape(text, flags) + ")" : pdfEscape(text, flags);
      };

      events.publish("putFont", {
        font: font,
        out: out,
        newObject: newObject,
        putStream: putStream,
        pdfEscapeWithNeededParanthesis: pdfEscapeWithNeededParanthesis
      });

      if (font.isAlreadyPutted !== true) {
        font.objectNumber = newObject();
        out("<<");
        out("/Type /Font");
        out("/BaseFont /" + pdfEscapeWithNeededParanthesis(font.postScriptName));
        out("/Subtype /Type1");

        if (typeof font.encoding === "string") {
          out("/Encoding /" + font.encoding);
        }

        out("/FirstChar 32");
        out("/LastChar 255");
        out(">>");
        out("endobj");
      }
    };

    var putFonts = function putFonts() {
      for (var fontKey in fonts) {
        if (fonts.hasOwnProperty(fontKey)) {
          if (putOnlyUsedFonts === false || putOnlyUsedFonts === true && usedFonts.hasOwnProperty(fontKey)) {
            putFont(fonts[fontKey]);
          }
        }
      }
    };

    var putXObject = function putXObject(xObject) {
      xObject.objectNumber = newObject();
      var options = [];
      options.push({
        key: "Type",
        value: "/XObject"
      });
      options.push({
        key: "Subtype",
        value: "/Form"
      });
      options.push({
        key: "BBox",
        value: "[" + [hpf(xObject.x), hpf(xObject.y), hpf(xObject.x + xObject.width), hpf(xObject.y + xObject.height)].join(" ") + "]"
      });
      options.push({
        key: "Matrix",
        value: "[" + xObject.matrix.toString() + "]"
      }); // TODO: /Resources

      var stream = xObject.pages[1].join("\n");
      putStream({
        data: stream,
        additionalKeyValues: options
      });
      out("endobj");
    };

    var putXObjects = function putXObjects() {
      for (var xObjectKey in renderTargets) {
        if (renderTargets.hasOwnProperty(xObjectKey)) {
          putXObject(renderTargets[xObjectKey]);
        }
      }
    };

    var interpolateAndEncodeRGBStream = function interpolateAndEncodeRGBStream(colors, numberSamples) {
      var tValues = [];
      var t;
      var dT = 1.0 / (numberSamples - 1);

      for (t = 0.0; t < 1.0; t += dT) {
        tValues.push(t);
      }

      tValues.push(1.0); // add first and last control point if not present

      if (colors[0].offset != 0.0) {
        var c0 = {
          offset: 0.0,
          color: colors[0].color
        };
        colors.unshift(c0);
      }

      if (colors[colors.length - 1].offset != 1.0) {
        var c1 = {
          offset: 1.0,
          color: colors[colors.length - 1].color
        };
        colors.push(c1);
      }

      var out = "";
      var index = 0;

      for (var i = 0; i < tValues.length; i++) {
        t = tValues[i];

        while (t > colors[index + 1].offset) {
          index++;
        }

        var a = colors[index].offset;
        var b = colors[index + 1].offset;
        var d = (t - a) / (b - a);
        var aColor = colors[index].color;
        var bColor = colors[index + 1].color;
        out += padd2Hex(Math.round((1 - d) * aColor[0] + d * bColor[0]).toString(16)) + padd2Hex(Math.round((1 - d) * aColor[1] + d * bColor[1]).toString(16)) + padd2Hex(Math.round((1 - d) * aColor[2] + d * bColor[2]).toString(16));
      }

      return out.trim();
    };

    var putShadingPattern = function putShadingPattern(pattern, numberSamples) {
      /*
       Axial patterns shade between the two points specified in coords, radial patterns between the inner
       and outer circle.
       The user can specify an array (colors) that maps t-Values in [0, 1] to RGB colors. These are now
       interpolated to equidistant samples and written to pdf as a sample (type 0) function.
       */
      // The number of color samples that should be used to describe the shading.
      // The higher, the more accurate the gradient will be.
      numberSamples || (numberSamples = 21);
      var funcObjectNumber = newObject();
      var stream = interpolateAndEncodeRGBStream(pattern.colors, numberSamples);
      var options = [];
      options.push({
        key: "FunctionType",
        value: "0"
      });
      options.push({
        key: "Domain",
        value: "[0.0 1.0]"
      });
      options.push({
        key: "Size",
        value: "[" + numberSamples + "]"
      });
      options.push({
        key: "BitsPerSample",
        value: "8"
      });
      options.push({
        key: "Range",
        value: "[0.0 1.0 0.0 1.0 0.0 1.0]"
      });
      options.push({
        key: "Decode",
        value: "[0.0 1.0 0.0 1.0 0.0 1.0]"
      });
      putStream({
        data: stream,
        additionalKeyValues: options,
        alreadyAppliedFilters: ["/ASCIIHexDecode"]
      });
      out("endobj");
      pattern.objectNumber = newObject();
      out("<< /ShadingType " + pattern.type);
      out("/ColorSpace /DeviceRGB");
      var coords = "/Coords [" + hpf(parseFloat(pattern.coords[0])) + " " + // x1
      hpf(parseFloat(pattern.coords[1])) + " "; // y1

      if (pattern.type === 2) {
        // axial
        coords += hpf(parseFloat(pattern.coords[2])) + " " + // x2
        hpf(parseFloat(pattern.coords[3])); // y2
      } else {
        // radial
        coords += hpf(parseFloat(pattern.coords[2])) + " " + // r1
        hpf(parseFloat(pattern.coords[3])) + " " + // x2
        hpf(parseFloat(pattern.coords[4])) + " " + // y2
        hpf(parseFloat(pattern.coords[5])); // r2
      }

      coords += "]";
      out(coords);

      if (pattern.matrix) {
        out("/Matrix [" + pattern.matrix.toString() + "]");
      }

      out("/Function " + funcObjectNumber + " 0 R");
      out("/Extend [true true]");
      out(">>");
      out("endobj");
    };

    var putTilingPattern = function putTilingPattern(pattern, deferredResourceDictionaryIds) {
      var resourcesObjectId = newObjectDeferred();
      var patternObjectId = newObject();
      deferredResourceDictionaryIds.push({
        resourcesOid: resourcesObjectId,
        objectOid: patternObjectId
      });
      pattern.objectNumber = patternObjectId;
      var options = [];
      options.push({
        key: "Type",
        value: "/Pattern"
      });
      options.push({
        key: "PatternType",
        value: "1"
      }); // tiling pattern

      options.push({
        key: "PaintType",
        value: "1"
      }); // colored tiling pattern

      options.push({
        key: "TilingType",
        value: "1"
      }); // constant spacing

      options.push({
        key: "BBox",
        value: "[" + pattern.boundingBox.map(hpf).join(" ") + "]"
      });
      options.push({
        key: "XStep",
        value: hpf(pattern.xStep)
      });
      options.push({
        key: "YStep",
        value: hpf(pattern.yStep)
      });
      options.push({
        key: "Resources",
        value: resourcesObjectId + " 0 R"
      });

      if (pattern.matrix) {
        options.push({
          key: "Matrix",
          value: "[" + pattern.matrix.toString() + "]"
        });
      }

      putStream({
        data: pattern.stream,
        additionalKeyValues: options
      });
      out("endobj");
    };

    var putPatterns = function putPatterns(deferredResourceDictionaryIds) {
      var patternKey;

      for (patternKey in patterns) {
        if (patterns.hasOwnProperty(patternKey)) {
          if (patterns[patternKey] instanceof API.ShadingPattern) {
            putShadingPattern(patterns[patternKey]);
          } else if (patterns[patternKey] instanceof API.TilingPattern) {
            putTilingPattern(patterns[patternKey], deferredResourceDictionaryIds);
          }
        }
      }
    };

    var putGState = function putGState(gState) {
      gState.objectNumber = newObject();
      out("<<");

      for (var p in gState) {
        switch (p) {
          case "opacity":
            out("/ca " + f2(gState[p]));
            break;

          case "stroke-opacity":
            out("/CA " + f2(gState[p]));
            break;
        }
      }

      out(">>");
      out("endobj");
    };

    var putGStates = function putGStates() {
      var gStateKey;

      for (gStateKey in gStates) {
        if (gStates.hasOwnProperty(gStateKey)) {
          putGState(gStates[gStateKey]);
        }
      }
    };

    var putXobjectDict = function putXobjectDict() {
      out("/XObject <<");

      for (var xObjectKey in renderTargets) {
        if (renderTargets.hasOwnProperty(xObjectKey) && renderTargets[xObjectKey].objectNumber >= 0) {
          out("/" + xObjectKey + " " + renderTargets[xObjectKey].objectNumber + " 0 R");
        }
      } // Loop through images, or other data objects


      events.publish("putXobjectDict");
      out(">>");
    };

    var putFontDict = function putFontDict() {
      out("/Font <<");

      for (var fontKey in fonts) {
        if (fonts.hasOwnProperty(fontKey)) {
          if (putOnlyUsedFonts === false || putOnlyUsedFonts === true && usedFonts.hasOwnProperty(fontKey)) {
            out("/" + fontKey + " " + fonts[fontKey].objectNumber + " 0 R");
          }
        }
      }

      out(">>");
    };

    var putShadingPatternDict = function putShadingPatternDict() {
      if (Object.keys(patterns).length > 0) {
        out("/Shading <<");

        for (var patternKey in patterns) {
          if (patterns.hasOwnProperty(patternKey) && patterns[patternKey] instanceof API.ShadingPattern && patterns[patternKey].objectNumber >= 0) {
            out("/" + patternKey + " " + patterns[patternKey].objectNumber + " 0 R");
          }
        }

        events.publish("putShadingPatternDict");
        out(">>");
      }
    };

    var putTilingPatternDict = function putTilingPatternDict(objectOid) {
      if (Object.keys(patterns).length > 0) {
        out("/Pattern <<");

        for (var patternKey in patterns) {
          if (patterns.hasOwnProperty(patternKey) && patterns[patternKey] instanceof API.TilingPattern && patterns[patternKey].objectNumber >= 0 && patterns[patternKey].objectNumber < objectOid // prevent cyclic dependencies
          ) {
              out("/" + patternKey + " " + patterns[patternKey].objectNumber + " 0 R");
            }
        }

        events.publish("putTilingPatternDict");
        out(">>");
      }
    };

    var putGStatesDict = function putGStatesDict() {
      if (Object.keys(gStates).length > 0) {
        var gStateKey;
        out("/ExtGState <<");

        for (gStateKey in gStates) {
          if (gStates.hasOwnProperty(gStateKey) && gStates[gStateKey].objectNumber >= 0) {
            out("/" + gStateKey + " " + gStates[gStateKey].objectNumber + " 0 R");
          }
        }

        events.publish("putGStateDict");
        out(">>");
      }
    };

    var putResourceDictionary = function putResourceDictionary(objectIds) {
      newObjectDeferredBegin(objectIds.resourcesOid, true);
      out("<<");
      out("/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]");
      putFontDict();
      putShadingPatternDict();
      putTilingPatternDict(objectIds.objectOid);
      putGStatesDict();
      putXobjectDict();
      out(">>");
      out("endobj");
    };

    var putResources = function putResources() {
      // FormObjects, Patterns etc. might use other FormObjects/Patterns/Images
      // which means their resource dictionaries must contain the already resolved
      // object ids. For this reason we defer the serialization of the resource
      // dicts until all objects have been serialized and have object ids.
      //
      // In order to prevent cyclic dependencies (which Adobe Reader doesn't like),
      // we only put all oids that are smaller than the oid of the object the
      // resource dict belongs to. This is correct behavior, since the streams
      // may only use other objects that have already been defined and thus appear
      // earlier in their respective collection.
      // Currently, this only affects tiling patterns, but a (more) correct
      // implementation of FormObjects would also define their own resource dicts.
      var deferredResourceDictionaryIds = [];
      putFonts();
      putGStates();
      putXObjects();
      putPatterns(deferredResourceDictionaryIds);
      events.publish("putResources");
      deferredResourceDictionaryIds.forEach(putResourceDictionary);
      putResourceDictionary({
        resourcesOid: resourceDictionaryObjId,
        objectOid: Number.MAX_SAFE_INTEGER // output all objects

      });
      events.publish("postPutResources");
    };

    var putAdditionalObjects = function putAdditionalObjects() {
      events.publish("putAdditionalObjects");

      for (var i = 0; i < additionalObjects.length; i++) {
        var obj = additionalObjects[i];
        newObjectDeferredBegin(obj.objId, true);
        out(obj.content);
        out("endobj");
      }

      events.publish("postPutAdditionalObjects");
    };

    var addFontToFontDictionary = function addFontToFontDictionary(font) {
      fontmap[font.fontName] = fontmap[font.fontName] || {};
      fontmap[font.fontName][font.fontStyle] = font.id;
    };

    var addFont = function addFont(postScriptName, fontName, fontStyle, encoding, isStandardFont) {
      var font = {
        id: "F" + (Object.keys(fonts).length + 1).toString(10),
        postScriptName: postScriptName,
        fontName: fontName,
        fontStyle: fontStyle,
        encoding: encoding,
        isStandardFont: isStandardFont || false,
        metadata: {}
      };
      var instance = this;
      events.publish("addFont", {
        font: font,
        instance: instance
      });
      fonts[font.id] = font;
      addFontToFontDictionary(font);
      return font.id;
    };

    var addFonts = function addFonts(arrayOfFonts) {
      for (var i = 0, l = standardFonts.length; i < l; i++) {
        var fontKey = addFont(arrayOfFonts[i][0], arrayOfFonts[i][1], arrayOfFonts[i][2], standardFonts[i][3], true);

        if (putOnlyUsedFonts === false) {
          usedFonts[fontKey] = true;
        } // adding aliases for standard fonts, this time matching the capitalization


        var parts = arrayOfFonts[i][0].split("-");
        addFontToFontDictionary({
          id: fontKey,
          fontName: parts[0],
          fontStyle: parts[1] || ""
        });
      }

      events.publish("addFonts", {
        fonts: fonts,
        dictionary: fontmap
      });
    };

    var SAFE = function __safeCall(fn) {
      fn.foo = function __safeCallWrapper() {
        try {
          return fn.apply(this, arguments);
        } catch (e) {
          var stack = e.stack || "";
          if (~stack.indexOf(" at ")) { stack = stack.split(" at ")[1]; }
          var m = "Error in function " + stack.split("\n")[0].split("<")[0] + ": " + e.message;

          if (global.console) {
            global.console.error(m, e);
            if (global.alert) { alert(m); }
          } else {
            throw new Error(m);
          }
        }
      };

      fn.foo.bar = fn;
      return fn.foo;
    };

    var to8bitStream = function to8bitStream(text, flags) {
      /**
       * PDF 1.3 spec:
       * "For text strings encoded in Unicode, the first two bytes must be 254 followed by
       * 255, representing the Unicode byte order marker, U+FEFF. (This sequence conflicts
       * with the PDFDocEncoding character sequence thorn ydieresis, which is unlikely
       * to be a meaningful beginning of a word or phrase.) The remainder of the
       * string consists of Unicode character codes, according to the UTF-16 encoding
       * specified in the Unicode standard, version 2.0. Commonly used Unicode values
       * are represented as 2 bytes per character, with the high-order byte appearing first
       * in the string."
       *
       * In other words, if there are chars in a string with char code above 255, we
       * recode the string to UCS2 BE - string doubles in length and BOM is prepended.
       *
       * HOWEVER!
       * Actual *content* (body) text (as opposed to strings used in document properties etc)
       * does NOT expect BOM. There, it is treated as a literal GID (Glyph ID)
       *
       * Because of Adobe's focus on "you subset your fonts!" you are not supposed to have
       * a font that maps directly Unicode (UCS2 / UTF16BE) code to font GID, but you could
       * fudge it with "Identity-H" encoding and custom CIDtoGID map that mimics Unicode
       * code page. There, however, all characters in the stream are treated as GIDs,
       * including BOM, which is the reason we need to skip BOM in content text (i.e. that
       * that is tied to a font).
       *
       * To signal this "special" PDFEscape / to8bitStream handling mode,
       * API.text() function sets (unless you overwrite it with manual values
       * given to API.text(.., flags) )
       * flags.autoencode = true
       * flags.noBOM = true
       *
       * ===================================================================================
       * `flags` properties relied upon:
       *   .sourceEncoding = string with encoding label.
       *                     "Unicode" by default. = encoding of the incoming text.
       *                     pass some non-existing encoding name
       *                     (ex: 'Do not touch my strings! I know what I am doing.')
       *                     to make encoding code skip the encoding step.
       *   .outputEncoding = Either valid PDF encoding name
       *                     (must be supported by jsPDF font metrics, otherwise no encoding)
       *                     or a JS object, where key = sourceCharCode, value = outputCharCode
       *                     missing keys will be treated as: sourceCharCode === outputCharCode
       *   .noBOM
       *       See comment higher above for explanation for why this is important
       *   .autoencode
       *       See comment higher above for explanation for why this is important
       */
      var i, l, sourceEncoding, encodingBlock, outputEncoding, newtext, isUnicode, ch, bch;
      flags = flags || {};
      sourceEncoding = flags.sourceEncoding || "Unicode";
      outputEncoding = flags.outputEncoding; // This 'encoding' section relies on font metrics format
      // attached to font objects by, among others,
      // "Willow Systems' standard_font_metrics plugin"
      // see jspdf.plugin.standard_font_metrics.js for format
      // of the font.metadata.encoding Object.
      // It should be something like
      //   .encoding = {'codePages':['WinANSI....'], 'WinANSI...':{code:code, ...}}
      //   .widths = {0:width, code:width, ..., 'fof':divisor}
      //   .kerning = {code:{previous_char_code:shift, ..., 'fof':-divisor},...}

      if ((flags.autoencode || outputEncoding) && fonts[activeFontKey].metadata && fonts[activeFontKey].metadata[sourceEncoding] && fonts[activeFontKey].metadata[sourceEncoding].encoding) {
        encodingBlock = fonts[activeFontKey].metadata[sourceEncoding].encoding; // each font has default encoding. Some have it clearly defined.

        if (!outputEncoding && fonts[activeFontKey].encoding) {
          outputEncoding = fonts[activeFontKey].encoding;
        } // Hmmm, the above did not work? Let's try again, in different place.


        if (!outputEncoding && encodingBlock.codePages) {
          outputEncoding = encodingBlock.codePages[0]; // let's say, first one is the default
        }

        if (typeof outputEncoding === "string") {
          outputEncoding = encodingBlock[outputEncoding];
        } // we want output encoding to be a JS Object, where
        // key = sourceEncoding's character code and
        // value = outputEncoding's character code.


        if (outputEncoding) {
          isUnicode = false;
          newtext = [];

          for (i = 0, l = text.length; i < l; i++) {
            ch = outputEncoding[text.charCodeAt(i)];

            if (ch) {
              newtext.push(String.fromCharCode(ch));
            } else {
              newtext.push(text[i]);
            } // since we are looping over chars anyway, might as well
            // check for residual unicodeness


            if (newtext[i].charCodeAt(0) >> 8) {
              /* more than 255 */
              isUnicode = true;
            }
          }

          text = newtext.join("");
        }
      }

      i = text.length; // isUnicode may be set to false above. Hence the triple-equal to undefined

      while (isUnicode === undefined && i !== 0) {
        if (text.charCodeAt(i - 1) >> 8) {
          /* more than 255 */
          isUnicode = true;
        }

        i--;
      }

      if (!isUnicode) {
        return text;
      }

      newtext = flags.noBOM ? [] : [254, 255];

      for (i = 0, l = text.length; i < l; i++) {
        ch = text.charCodeAt(i);
        bch = ch >> 8; // divide by 256

        if (bch >> 8) {
          /* something left after dividing by 256 second time */
          throw new Error("Character at position " + i + " of string '" + text + "' exceeds 16bits. Cannot be encoded into UCS-2 BE");
        }

        newtext.push(bch);
        newtext.push(ch - (bch << 8));
      }

      return String.fromCharCode.apply(undefined, newtext);
    };

    var pdfEscape = API.__private__.pdfEscape = API.pdfEscape = function (text, flags) {
      /**
       * Replace '/', '(', and ')' with pdf-safe versions
       *
       * Doing to8bitStream does NOT make this PDF display unicode text. For that
       * we also need to reference a unicode font and embed it - royal pain in the rear.
       *
       * There is still a benefit to to8bitStream - PDF simply cannot handle 16bit chars,
       * which JavaScript Strings are happy to provide. So, while we still cannot display
       * 2-byte characters property, at least CONDITIONALLY converting (entire string containing)
       * 16bit chars to (USC-2-BE) 2-bytes per char + BOM streams we ensure that entire PDF
       * is still parseable.
       * This will allow immediate support for unicode in document properties strings.
       */
      return to8bitStream(text, flags).replace(/\\/g, "\\\\").replace(/\(/g, "\\(").replace(/\)/g, "\\)");
    };

    var beginPage = API.__private__.beginPage = function (format) {
      pages[++page] = [];
      pagesContext[page] = {
        objId: 0,
        contentsObjId: 0,
        userUnit: Number(userUnit),
        artBox: null,
        bleedBox: null,
        cropBox: null,
        trimBox: null,
        mediaBox: {
          bottomLeftX: 0,
          bottomLeftY: 0,
          topRightX: Number(format[0]),
          topRightY: Number(format[1])
        }
      };

      _setPage(page);

      setOutputDestination(pages[currentPage]);
    };

    var _addPage = function _addPage(parmFormat, parmOrientation) {
      var dimensions, width, height;
      orientation = parmOrientation || orientation;

      if (typeof parmFormat === "string") {
        dimensions = getPageFormat(parmFormat.toLowerCase());

        if (Array.isArray(dimensions)) {
          width = dimensions[0];
          height = dimensions[1];
        }
      }

      if (Array.isArray(parmFormat)) {
        width = parmFormat[0] * scaleFactor;
        height = parmFormat[1] * scaleFactor;
      }

      if (isNaN(width)) {
        width = format[0];
        height = format[1];
      }

      if (width > 14400 || height > 14400) {
        console.warn("A page in a PDF can not be wider or taller than 14400 userUnit. jsPDF limits the width/height to 14400");
        width = Math.min(14400, width);
        height = Math.min(14400, height);
      }

      format = [width, height];

      switch (orientation.substr(0, 1)) {
        case "l":
          if (height > width) {
            format = [height, width];
          }

          break;

        case "p":
          if (width > height) {
            format = [height, width];
          }

          break;
      }

      beginPage(format); // Set line width

      setLineWidth(lineWidth); // Set draw color

      out(strokeColor); // resurrecting non-default line caps, joins

      if (lineCapID !== 0) {
        out(lineCapID + " J");
      }

      if (lineJoinID !== 0) {
        out(lineJoinID + " j");
      }

      events.publish("addPage", {
        pageNumber: page
      });
    };

    var _deletePage = function _deletePage(n) {
      if (n > 0 && n <= page) {
        pages.splice(n, 1);
        pagesContext.splice(n, 1);
        page--;

        if (currentPage > page) {
          currentPage = page;
        }

        this.setPage(currentPage);
      }
    };

    var _setPage = function _setPage(n) {
      if (n > 0 && n <= page) {
        currentPage = n;
      }
    };

    var getNumberOfPages = API.__private__.getNumberOfPages = API.getNumberOfPages = function () {
      return pages.length - 1;
    };
    /**
     * Returns a document-specific font key - a label assigned to a
     * font name + font type combination at the time the font was added
     * to the font inventory.
     *
     * Font key is used as label for the desired font for a block of text
     * to be added to the PDF document stream.
     * @private
     * @function
     * @param fontName {string} can be undefined on "falthy" to indicate "use current"
     * @param fontStyle {string} can be undefined on "falthy" to indicate "use current"
     * @returns {string} Font key.
     * @ignore
     */


    var getFont = function getFont(fontName, fontStyle, options) {
      var key = undefined,
          fontNameLowerCase;
      options = options || {};
      fontName = fontName !== undefined ? fontName : fonts[activeFontKey].fontName;
      fontStyle = fontStyle !== undefined ? fontStyle : fonts[activeFontKey].fontStyle;
      fontNameLowerCase = fontName.toLowerCase();

      if (fontmap[fontNameLowerCase] !== undefined && fontmap[fontNameLowerCase][fontStyle] !== undefined) {
        key = fontmap[fontNameLowerCase][fontStyle];
      } else if (fontmap[fontName] !== undefined && fontmap[fontName][fontStyle] !== undefined) {
        key = fontmap[fontName][fontStyle];
      } else {
        if (options.disableWarning === false) {
          console.warn("Unable to look up font label for font '" + fontName + "', '" + fontStyle + "'. Refer to getFontList() for available fonts.");
        }
      }

      if (!key && !options.noFallback) {
        key = fontmap["times"][fontStyle];

        if (key == null) {
          key = fontmap["times"]["normal"];
        }
      }

      return key;
    };

    var putInfo = API.__private__.putInfo = function () {
      newObject();
      out("<<");
      out("/Producer (jsPDF " + jsPDF.version + ")");

      for (var key in documentProperties) {
        if (documentProperties.hasOwnProperty(key) && documentProperties[key]) {
          out("/" + key.substr(0, 1).toUpperCase() + key.substr(1) + " (" + pdfEscape(documentProperties[key]) + ")");
        }
      }

      out("/CreationDate (" + creationDate + ")");
      out(">>");
      out("endobj");
    };

    var putCatalog = API.__private__.putCatalog = function (options) {
      options = options || {};
      var tmpRootDictionaryObjId = options.rootDictionaryObjId || rootDictionaryObjId;
      newObject();
      out("<<");
      out("/Type /Catalog");
      out("/Pages " + tmpRootDictionaryObjId + " 0 R"); // PDF13ref Section 7.2.1

      if (!zoomMode) { zoomMode = "fullwidth"; }

      switch (zoomMode) {
        case "fullwidth":
          out("/OpenAction [3 0 R /FitH null]");
          break;

        case "fullheight":
          out("/OpenAction [3 0 R /FitV null]");
          break;

        case "fullpage":
          out("/OpenAction [3 0 R /Fit]");
          break;

        case "original":
          out("/OpenAction [3 0 R /XYZ null null 1]");
          break;

        default:
          var pcn = "" + zoomMode;
          if (pcn.substr(pcn.length - 1) === "%") { zoomMode = parseInt(zoomMode) / 100; }

          if (typeof zoomMode === "number") {
            out("/OpenAction [3 0 R /XYZ null null " + f2(zoomMode) + "]");
          }

      }

      if (!layoutMode) { layoutMode = "continuous"; }

      switch (layoutMode) {
        case "continuous":
          out("/PageLayout /OneColumn");
          break;

        case "single":
          out("/PageLayout /SinglePage");
          break;

        case "two":
        case "twoleft":
          out("/PageLayout /TwoColumnLeft");
          break;

        case "tworight":
          out("/PageLayout /TwoColumnRight");
          break;
      }

      if (pageMode) {
        /**
         * A name object specifying how the document should be displayed when opened:
         * UseNone      : Neither document outline nor thumbnail images visible -- DEFAULT
         * UseOutlines  : Document outline visible
         * UseThumbs    : Thumbnail images visible
         * FullScreen   : Full-screen mode, with no menu bar, window controls, or any other window visible
         */
        out("/PageMode /" + pageMode);
      }

      events.publish("putCatalog");
      out(">>");
      out("endobj");
    };

    var putTrailer = API.__private__.putTrailer = function () {
      out("trailer");
      out("<<");
      out("/Size " + (objectNumber + 1));
      out("/Root " + objectNumber + " 0 R");
      out("/Info " + (objectNumber - 1) + " 0 R");
      out("/ID [ <" + fileId + "> <" + fileId + "> ]");
      out(">>");
    };

    var putHeader = API.__private__.putHeader = function () {
      out("%PDF-" + pdfVersion);
      out("%\xBA\xDF\xAC\xE0");
    };

    var putXRef = API.__private__.putXRef = function () {
      var p = "0000000000";
      out("xref");
      out("0 " + (objectNumber + 1));
      out("0000000000 65535 f");

      for (var i = 1; i <= objectNumber; i++) {
        var offset = offsets[i];

        if (typeof offset === "function") {
          out((p + offsets[i]()).slice(-10) + " 00000 n");
        } else {
          if (typeof offsets[i] !== "undefined") {
            out((p + offsets[i]).slice(-10) + " 00000 n");
          } else {
            out("0000000000 00000 n");
          }
        }
      }
    };

    var buildDocument = API.__private__.buildDocument = function () {
      resetDocument();
      setOutputDestination(content);
      events.publish("buildDocument");
      putHeader();
      putPages();
      putAdditionalObjects();
      putResources();
      putInfo();
      putCatalog();
      var offsetOfXRef = contentLength;
      putXRef();
      putTrailer();
      out("startxref");
      out("" + offsetOfXRef);
      out("%%EOF");
      setOutputDestination(pages[currentPage]);
      return content.join("\n");
    };

    var getBlob = API.__private__.getBlob = function (data) {
      return new Blob([getArrayBuffer(data)], {
        type: "application/pdf"
      });
    };
    /**
     * Generates the PDF document.
     *
     * If `type` argument is undefined, output is raw body of resulting PDF returned as a string.
     *
     * @param {string} type A string identifying one of the possible output types. Possible values are 'arraybuffer', 'blob', 'bloburi'/'bloburl', 'datauristring'/'dataurlstring', 'datauri'/'dataurl', 'dataurlnewwindow', 'pdfobjectnewwindow', 'pdfjsnewwindow'.
     * @param {Object} options An object providing some additional signalling to PDF generator. Possible options are 'filename'.
     *
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name output
     */


    var output = API.output = API.__private__.output = SAFE(function output(type, options) {
      options = options || {};

      if (typeof options === "string") {
        options = {
          filename: options
        };
      } else {
        options.filename = options.filename || "generated.pdf";
      }

      switch (type) {
        case undefined:
          return buildDocument();

        case "save":
          API.save(options.filename);
          break;

        case "arraybuffer":
          return getArrayBuffer(buildDocument());

        case "blob":
          return getBlob(buildDocument());

        case "bloburi":
        case "bloburl":
          // Developer is responsible of calling revokeObjectURL
          if (typeof global.URL !== "undefined" && typeof global.URL.createObjectURL === "function") {
            return global.URL && global.URL.createObjectURL(getBlob(buildDocument())) || void 0;
          } else {
            console.warn("bloburl is not supported by your system, because URL.createObjectURL is not supported by your browser.");
          }

          break;

        case "datauristring":
        case "dataurlstring":
          var dataURI = "";
          var pdfDocument = buildDocument();

          try {
            dataURI = btoa(pdfDocument);
          } catch (e) {
            dataURI = btoa(unescape(encodeURIComponent(pdfDocument)));
          }

          return "data:application/pdf;filename=" + options.filename + ";base64," + dataURI;

        case "pdfobjectnewwindow":
          if (Object.prototype.toString.call(global) === "[object Window]") {
            var pdfObjectUrl = options.pdfObjectUrl || "https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.1.1/pdfobject.min.js";
            var htmlForNewWindow = "<html>" + '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style><body><script src="' + pdfObjectUrl + '"></script><script >PDFObject.embed("' + this.output("dataurlstring") + '", ' + JSON.stringify(options) + ");</script></body></html>";
            var nW = global.open();

            if (nW !== null) {
              nW.document.write(htmlForNewWindow);
            }

            return nW;
          } else {
            throw new Error("The option pdfobjectnewwindow just works in a browser-environment.");
          }

        case "pdfjsnewwindow":
          if (Object.prototype.toString.call(global) === "[object Window]") {
            var pdfJsUrl = options.pdfJsUrl || "examples/PDF.js/web/viewer.html";
            var htmlForPDFjsNewWindow = "<html>" + "<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>" + '<body><iframe id="pdfViewer" src="' + pdfJsUrl + '?file=" width="500px" height="400px" />' + "</body></html>";
            var PDFjsNewWindow = global.open();

            if (PDFjsNewWindow !== null) {
              PDFjsNewWindow.document.write(htmlForPDFjsNewWindow);
              var scope = this;

              PDFjsNewWindow.document.documentElement.querySelector("#pdfViewer").onload = function () {
                PDFjsNewWindow.document.documentElement.querySelector("#pdfViewer").contentWindow.PDFViewerApplication.open(scope.output("bloburl"));
              };
            }

            return PDFjsNewWindow;
          } else {
            throw new Error("The option pdfjsnewwindow just works in a browser-environment.");
          }

        case "dataurlnewwindow":
          if (Object.prototype.toString.call(global) === "[object Window]") {
            var htmlForDataURLNewWindow = "<html>" + "<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>" + "<body>" + '<iframe src="' + this.output("datauristring", options) + '"></iframe>' + "</body></html>";
            var dataURLNewWindow = global.open();

            if (dataURLNewWindow !== null) {
              dataURLNewWindow.document.write(htmlForDataURLNewWindow);
            }

            if (dataURLNewWindow || typeof safari === "undefined") { return dataURLNewWindow; }
          } else {
            throw new Error("The option dataurlnewwindow just works in a browser-environment.");
          }

          break;

        case "datauri":
        case "dataurl":
          return global.document.location.href = this.output("datauristring", options);

        default:
          return null;
      }
    });
    /**
     * Used to see if a supplied hotfix was requested when the pdf instance was created.
     * @param {string} hotfixName - The name of the hotfix to check.
     * @returns {boolean}
     */

    var hasHotfix = function hasHotfix(hotfixName) {
      return Array.isArray(hotfixes) === true && hotfixes.indexOf(hotfixName) > -1;
    };

    switch (unit) {
      case "pt":
        scaleFactor = 1;
        break;

      case "mm":
        scaleFactor = 72 / 25.4;
        break;

      case "cm":
        scaleFactor = 72 / 2.54;
        break;

      case "in":
        scaleFactor = 72;
        break;

      case "px":
        if (hasHotfix("px_scaling") == true) {
          scaleFactor = 72 / 96;
        } else {
          scaleFactor = 96 / 72;
        }

        break;

      case "pc":
        scaleFactor = 12;
        break;

      case "em":
        scaleFactor = 12;
        break;

      case "ex":
        scaleFactor = 6;
        break;

      default:
        throw new Error("Invalid unit: " + unit);
    }

    setCreationDate();
    setFileId(); //---------------------------------------
    // Public API

    var getPageInfo = API.__private__.getPageInfo = API.getPageInfo = function (pageNumberOneBased) {
      if (isNaN(pageNumberOneBased) || pageNumberOneBased % 1 !== 0) {
        throw new Error("Invalid argument passed to jsPDF.getPageInfo");
      }

      var objId = pagesContext[pageNumberOneBased].objId;
      return {
        objId: objId,
        pageNumber: pageNumberOneBased,
        pageContext: pagesContext[pageNumberOneBased]
      };
    };

    var getPageInfoByObjId = API.__private__.getPageInfoByObjId = function (objId) {
      if (isNaN(objId) || objId % 1 !== 0) {
        throw new Error("Invalid argument passed to jsPDF.getPageInfoByObjId");
      }

      for (var pageNumber in pagesContext) {
        if (pagesContext[pageNumber].objId === objId) {
          break;
        }
      }

      return getPageInfo(pageNumber);
    };

    var getCurrentPageInfo = API.__private__.getCurrentPageInfo = API.getCurrentPageInfo = function () {
      return {
        objId: pagesContext[currentPage].objId,
        pageNumber: currentPage,
        pageContext: pagesContext[currentPage]
      };
    };
    /**
     * Adds (and transfers the focus to) new page to the PDF document.
     * @param format {String/Array} The format of the new page. Can be: <ul><li>a0 - a10</li><li>b0 - b10</li><li>c0 - c10</li><li>dl</li><li>letter</li><li>government-letter</li><li>legal</li><li>junior-legal</li><li>ledger</li><li>tabloid</li><li>credit-card</li></ul><br />
     * Default is "a4". If you want to use your own format just pass instead of one of the above predefined formats the size as an number-array, e.g. [595.28, 841.89]
     * @param orientation {string} Orientation of the new page. Possible values are "portrait" or "landscape" (or shortcuts "p" (Default), "l").
     * @function
     * @instance
     * @returns {jsPDF}
     *
     * @memberof jsPDF#
     * @name addPage
     */


    API.addPage = function () {
      _addPage.apply(this, arguments);

      return this;
    };
    /**
     * Adds (and transfers the focus to) new page to the PDF document.
     * @function
     * @instance
     * @returns {jsPDF}
     *
     * @memberof jsPDF#
     * @name setPage
     * @param {number} page Switch the active page to the page number specified.
     * @example
     * doc = jsPDF()
     * doc.addPage()
     * doc.addPage()
     * doc.text('I am on page 3', 10, 10)
     * doc.setPage(1)
     * doc.text('I am on page 1', 10, 10)
     */


    API.setPage = function () {
      _setPage.apply(this, arguments);

      setOutputDestination.call(this, pages[currentPage]);
      return this;
    };
    /**
     * @name insertPage
     * @memberof jsPDF#
     *
     * @function
     * @instance
     * @param {Object} beforePage
     * @returns {jsPDF}
     */


    API.insertPage = function (beforePage) {
      this.addPage();
      this.movePage(currentPage, beforePage);
      return this;
    };
    /**
     * @name movePage
     * @memberof jsPDF#
     * @function
     * @instance
     * @param {number} targetPage
     * @param {number} beforePage
     * @returns {jsPDF}
     */


    API.movePage = function (targetPage, beforePage) {
      var tmpPages, tmpPagesContext;

      if (targetPage > beforePage) {
        tmpPages = pages[targetPage];
        tmpPagesContext = pagesContext[targetPage];

        for (var i = targetPage; i > beforePage; i--) {
          pages[i] = pages[i - 1];
          pagesContext[i] = pagesContext[i - 1];
        }

        pages[beforePage] = tmpPages;
        pagesContext[beforePage] = tmpPagesContext;
        this.setPage(beforePage);
      } else if (targetPage < beforePage) {
        tmpPages = pages[targetPage];
        tmpPagesContext = pagesContext[targetPage];

        for (var j = targetPage; j < beforePage; j++) {
          pages[j] = pages[j + 1];
          pagesContext[j] = pagesContext[j + 1];
        }

        pages[beforePage] = tmpPages;
        pagesContext[beforePage] = tmpPagesContext;
        this.setPage(beforePage);
      }

      return this;
    };
    /**
     * Deletes a page from the PDF.
     * @name deletePage
     * @memberof jsPDF#
     * @function
     * @param {number} targetPage
     * @instance
     * @returns {jsPDF}
     */


    API.deletePage = function () {
      _deletePage.apply(this, arguments);

      return this;
    };
    /**
     * Adds text to page. Supports adding multiline text when 'text' argument is an Array of Strings.
     *
     * @function
     * @instance
     * @param {String|Array} text String or array of strings to be added to the page. Each line is shifted one line down per font, spacing settings declared before this call.
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page.
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page.
     * @param {Object} [options] - Collection of settings signaling how the text must be encoded.
     * @param {string} [options.align=left] - The alignment of the text, possible values: left, center, right, justify.
     * @param {string} [options.baseline=alphabetic] - Sets text baseline used when drawing the text, possible values: alphabetic, ideographic, bottom, top, middle, hanging
     * @param {string} [options.angle=0] - Rotate the text clockwise or counterclockwise. Expects the angle in degree.
     * @param {string} [options.rotationDirection=1] - Direction of the rotation. 0 = clockwise, 1 = counterclockwise.
     * @param {string} [options.charSpace=0] - The space between each letter.
     * @param {string} [options.lineHeightFactor=1.15] - The lineheight of each line.
     * @param {string} [options.flags] - Flags for to8bitStream.
     * @param {string} [options.flags.noBOM=true] - Don't add BOM to Unicode-text.
     * @param {string} [options.flags.autoencode=true] - Autoencode the Text.
     * @param {string} [options.maxWidth=0] - Split the text by given width, 0 = no split.
     * @param {string} [options.renderingMode=fill] - Set how the text should be rendered, possible values: fill, stroke, fillThenStroke, invisible, fillAndAddForClipping, strokeAndAddPathForClipping, fillThenStrokeAndAddToPathForClipping, addToPathForClipping.
     * @param {boolean} [options.isInputVisual] - Option for the BidiEngine
     * @param {boolean} [options.isOutputVisual] - Option for the BidiEngine
     * @param {boolean} [options.isInputRtl] - Option for the BidiEngine
     * @param {boolean} [options.isOutputRtl] - Option for the BidiEngine
     * @param {boolean} [options.isSymmetricSwapping] - Option for the BidiEngine
     * @param {number|Matrix} transform If transform is a number the text will be rotated by this value around the anchor set by x and y.
     *
     * If it is a Matrix, this matrix gets directly applied to the text, which allows shearing
     * effects etc.; the x and y offsets are then applied AFTER the coordinate system has been established by this
     * matrix. This means passing a rotation matrix that is equivalent to some rotation angle will in general yield a
     * DIFFERENT result. A matrix is only allowed in "advanced" API mode.
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name text
     */


    API.__private__.text = API.text = function (text, x, y, options, transform) {
      /*
       * Inserts something like this into PDF
       *   BT
       *    /F1 16 Tf  % Font name + size
       *    16 TL % How many units down for next line in multiline text
       *    0 g % color
       *    28.35 813.54 Td % position
       *    (line one) Tj
       *    T* (line two) Tj
       *    T* (line three) Tj
       *   ET
       */
      options = options || {};
      var scope = options.scope || this;
      var payload, da, angle, align, charSpace, maxWidth, flags; // Pre-August-2012 the order of arguments was function(x, y, text, flags)
      // in effort to make all calls have similar signature like
      //   function(data, coordinates... , miscellaneous)
      // this method had its args flipped.
      // code below allows backward compatibility with old arg order.

      if (typeof text === "number" && typeof x === "number" && (typeof y === "string" || Array.isArray(y))) {
        var tmp = y;
        y = x;
        x = text;
        text = tmp;
      }

      var transformationMatrix;

      if (arguments[3] instanceof Matrix === false) {
        flags = arguments[3];
        angle = arguments[4];
        align = arguments[5];

        if (_typeof(flags) !== "object" || flags === null) {
          if (typeof angle === "string") {
            align = angle;
            angle = null;
          }

          if (typeof flags === "string") {
            align = flags;
            flags = null;
          }

          if (typeof flags === "number") {
            angle = flags;
            flags = null;
          }

          options = {
            flags: flags,
            angle: angle,
            align: align
          };
        }
      } else {
        advancedApiModeTrap("The transform parameter of text() with a Matrix value");
        transformationMatrix = transform;
      }

      if (isNaN(x) || isNaN(y) || typeof text === "undefined" || text === null) {
        throw new Error("Invalid arguments passed to jsPDF.text");
      }

      if (text.length === 0) {
        return scope;
      }

      var xtra = "";
      var isHex = false;
      var lineHeight = typeof options.lineHeightFactor === "number" ? options.lineHeightFactor : lineHeightFactor;
      var scaleFactor = scope.internal.scaleFactor;

      function ESC(s) {
        s = s.split("\t").join(Array(options.TabLen || 9).join(" "));
        return pdfEscape(s, flags);
      }

      function transformTextToSpecialArray(text) {
        //we don't want to destroy original text array, so cloning it
        var sa = text.concat();
        var da = [];
        var len = sa.length;
        var curDa; //we do array.join('text that must not be PDFescaped")
        //thus, pdfEscape each component separately

        while (len--) {
          curDa = sa.shift();

          if (typeof curDa === "string") {
            da.push(curDa);
          } else {
            if (Array.isArray(text) && (curDa.length === 1 || curDa[1] === undefined && curDa[2] === undefined)) {
              da.push(curDa[0]);
            } else {
              da.push([curDa[0], curDa[1], curDa[2]]);
            }
          }
        }

        return da;
      }

      function processTextByFunction(text, processingFunction) {
        var result;

        if (typeof text === "string") {
          result = processingFunction(text)[0];
        } else if (Array.isArray(text)) {
          //we don't want to destroy original text array, so cloning it
          var sa = text.concat();
          var da = [];
          var len = sa.length;
          var curDa;
          var tmpResult; //we do array.join('text that must not be PDFescaped")
          //thus, pdfEscape each component separately

          while (len--) {
            curDa = sa.shift();

            if (typeof curDa === "string") {
              da.push(processingFunction(curDa)[0]);
            } else if (Array.isArray(curDa) && typeof curDa[0] === "string") {
              tmpResult = processingFunction(curDa[0], curDa[1], curDa[2]);
              da.push([tmpResult[0], tmpResult[1], tmpResult[2]]);
            }
          }

          result = da;
        }

        return result;
      } //Check if text is of type String


      var textIsOfTypeString = false;
      var tmpTextIsOfTypeString = true;

      if (typeof text === "string") {
        textIsOfTypeString = true;
      } else if (Array.isArray(text)) {
        //we don't want to destroy original text array, so cloning it
        var sa = text.concat();
        da = [];
        var len = sa.length;
        var curDa; //we do array.join('text that must not be PDFescaped")
        //thus, pdfEscape each component separately

        while (len--) {
          curDa = sa.shift();

          if (typeof curDa !== "string" || Array.isArray(curDa) && typeof curDa[0] !== "string") {
            tmpTextIsOfTypeString = false;
          }
        }

        textIsOfTypeString = tmpTextIsOfTypeString;
      }

      if (textIsOfTypeString === false) {
        throw new Error('Type of text must be string or Array. "' + text + '" is not recognized.');
      } //If there are any newlines in text, we assume
      //the user wanted to print multiple lines, so break the
      //text up into an array. If the text is already an array,
      //we assume the user knows what they are doing.
      //Convert text into an array anyway to simplify
      //later code.


      if (typeof text === "string") {
        if (text.match(/[\r?\n]/)) {
          text = text.split(/\r\n|\r|\n/g);
        } else {
          text = [text];
        }
      } //baseline


      var height = activeFontSize / scope.internal.scaleFactor;
      var descent = height * (lineHeightFactor - 1);

      switch (options.baseline) {
        case "bottom":
          y -= descent;
          break;

        case "top":
          y += height - descent;
          break;

        case "hanging":
          y += height - 2 * descent;
          break;

        case "middle":
          y += height / 2 - descent;
          break;

        case "ideographic":
        case "alphabetic":
        default:
          // do nothing, everything is fine
          break;
      } //multiline


      maxWidth = options.maxWidth || 0;

      if (maxWidth > 0) {
        if (typeof text === "string") {
          text = scope.splitTextToSize(text, maxWidth);
        } else if (Object.prototype.toString.call(text) === "[object Array]") {
          text = scope.splitTextToSize(text.join(" "), maxWidth);
        }
      } //creating Payload-Object to make text byRef


      payload = {
        text: text,
        x: x,
        y: y,
        options: options,
        mutex: {
          pdfEscape: pdfEscape,
          activeFontKey: activeFontKey,
          fonts: fonts,
          activeFontSize: activeFontSize
        }
      };
      events.publish("preProcessText", payload);
      text = payload.text;
      options = payload.options; //angle

      angle = options.angle;

      if (transformationMatrix instanceof Matrix === false && angle && typeof angle === "number") {
        angle *= Math.PI / 180;

        if (options.rotationDirection === 0) {
          angle = -angle;
        }

        if (apiMode === ApiMode.ADVANCED) {
          angle = -angle;
        }

        var c = Math.cos(angle);
        var s = Math.sin(angle);
        transformationMatrix = new Matrix(c, s, -s, c, 0, 0);
      } else if (angle && angle instanceof Matrix) {
        transformationMatrix = angle;
      }

      if (apiMode === ApiMode.ADVANCED && !transformationMatrix) {
        transformationMatrix = identityMatrix;
      } //charSpace


      charSpace = options.charSpace || activeCharSpace;

      if (typeof charSpace !== "undefined") {
        xtra += hpf(scale(charSpace)) + " Tc\n";
        this.setCharSpace(this.getCharSpace() || 0);
      } //lang


      var lang = options.lang;
      //renderingMode


      var renderingMode = -1;
      var parmRenderingMode = typeof options.renderingMode !== "undefined" ? options.renderingMode : options.stroke;
      var pageContext = scope.internal.getCurrentPageInfo().pageContext;

      switch (parmRenderingMode) {
        case 0:
        case false:
        case "fill":
          renderingMode = 0;
          break;

        case 1:
        case true:
        case "stroke":
          renderingMode = 1;
          break;

        case 2:
        case "fillThenStroke":
          renderingMode = 2;
          break;

        case 3:
        case "invisible":
          renderingMode = 3;
          break;

        case 4:
        case "fillAndAddForClipping":
          renderingMode = 4;
          break;

        case 5:
        case "strokeAndAddPathForClipping":
          renderingMode = 5;
          break;

        case 6:
        case "fillThenStrokeAndAddToPathForClipping":
          renderingMode = 6;
          break;

        case 7:
        case "addToPathForClipping":
          renderingMode = 7;
          break;
      }

      var usedRenderingMode = typeof pageContext.usedRenderingMode !== "undefined" ? pageContext.usedRenderingMode : -1; //if the coder wrote it explicitly to use a specific
      //renderingMode, then use it

      if (renderingMode !== -1) {
        xtra += renderingMode + " Tr\n"; //otherwise check if we used the rendering Mode already
        //if so then set the rendering Mode...
      } else if (usedRenderingMode !== -1) {
        xtra += "0 Tr\n";
      }

      if (renderingMode !== -1) {
        pageContext.usedRenderingMode = renderingMode;
      } //align


      align = options.align || "left";
      var leading = activeFontSize * lineHeight;
      var pageWidth = scope.internal.pageSize.getWidth();
      var activeFont = fonts[activeFontKey];
      charSpace = options.charSpace || activeCharSpace;
      maxWidth = options.maxWidth || 0;
      var lineWidths;
      flags = {};
      var wordSpacingPerLine = [];

      if (Object.prototype.toString.call(text) === "[object Array]") {
        da = transformTextToSpecialArray(text);
        var newY;

        if (align !== "left") {
          lineWidths = da.map(function (v) {
            return scope.getStringUnitWidth(v, {
              font: activeFont,
              charSpace: charSpace,
              fontSize: activeFontSize,
              doKerning: false
            }) * activeFontSize / scaleFactor;
          });
        } //The first line uses the "main" Td setting,
        //and the subsequent lines are offset by the
        //previous line's x coordinate.


        var prevWidth = 0;
        var newX;

        if (align === "right") {
          //The passed in x coordinate defines the
          //rightmost point of the text.
          x -= lineWidths[0];
          text = [];
          len = da.length;

          for (var i = 0; i < len; i++) {
            if (i === 0) {
              newX = getHorizontalCoordinate(x);
              newY = getVerticalCoordinate(y);
            } else {
              newX = scale(prevWidth - lineWidths[i]);
              newY = -leading;
            }

            text.push([da[i], newX, newY]);
            prevWidth = lineWidths[i];
          }
        } else if (align === "center") {
          //The passed in x coordinate defines
          //the center point.
          x -= lineWidths[0] / 2;
          text = [];
          len = da.length;

          for (var j = 0; j < len; j++) {
            if (j === 0) {
              newX = getHorizontalCoordinate(x);
              newY = getVerticalCoordinate(y);
            } else {
              newX = scale((prevWidth - lineWidths[j]) / 2);
              newY = -leading;
            }

            text.push([da[j], newX, newY]);
            prevWidth = lineWidths[j];
          }
        } else if (align === "left") {
          text = [];
          len = da.length;

          for (var h = 0; h < len; h++) {
            text.push(da[h]);
          }
        } else if (align === "justify") {
          text = [];
          len = da.length;
          maxWidth = maxWidth !== 0 ? maxWidth : pageWidth;

          for (var l = 0; l < len; l++) {
            newY = l === 0 ? getVerticalCoordinate(y) : -leading;
            newX = l === 0 ? getHorizontalCoordinate(x) : 0;

            if (l < len - 1) {
              wordSpacingPerLine.push(hpf(scale((maxWidth - lineWidths[l]) / (da[l].split(" ").length - 1))));
            }

            text.push([da[l], newX, newY]);
          }
        } else {
          throw new Error('Unrecognized alignment option, use "left", "center", "right" or "justify".');
        }
      } //R2L


      var doReversing = typeof options.R2L === "boolean" ? options.R2L : R2L;

      if (doReversing === true) {
        text = processTextByFunction(text, function (text, posX, posY) {
          return [text.split("").reverse().join(""), posX, posY];
        });
      } //creating Payload-Object to make text byRef


      payload = {
        text: text,
        x: x,
        y: y,
        options: options,
        mutex: {
          pdfEscape: pdfEscape,
          activeFontKey: activeFontKey,
          fonts: fonts,
          activeFontSize: activeFontSize
        }
      };
      events.publish("postProcessText", payload);
      text = payload.text;
      isHex = payload.mutex.isHex || false; //Escaping

      var activeFontEncoding = fonts[activeFontKey].encoding;

      if (activeFontEncoding === "WinAnsiEncoding" || activeFontEncoding === "StandardEncoding") {
        text = processTextByFunction(text, function (text, posX, posY) {
          return [ESC(text), posX, posY];
        });
      }

      da = transformTextToSpecialArray(text);
      text = [];
      var STRING = 0;
      var ARRAY = 1;
      var variant = Array.isArray(da[0]) ? ARRAY : STRING;
      var posX;
      var posY;
      var content;
      var wordSpacing = "";

      var generatePosition = function generatePosition(parmPosX, parmPosY, parmTransformationMatrix) {
        var position = "";

        if (parmTransformationMatrix instanceof Matrix) {
          // It is kind of more intuitive to apply a plain rotation around the text anchor set by x and y
          // but when the user supplies an arbitrary transformation matrix, the x and y offsets should be applied
          // in the coordinate system established by this matrix
          if (typeof options.angle === "number") {
            parmTransformationMatrix = matrixMult(parmTransformationMatrix, new Matrix(1, 0, 0, 1, parmPosX, parmPosY));
          } else {
            parmTransformationMatrix = matrixMult(new Matrix(1, 0, 0, 1, parmPosX, parmPosY), parmTransformationMatrix);
          }

          if (apiMode === ApiMode.ADVANCED) {
            parmTransformationMatrix = matrixMult(new Matrix(1, 0, 0, -1, 0, 0), parmTransformationMatrix);
          }

          position = parmTransformationMatrix.join(" ") + " Tm\n";
        } else {
          position = hpf(parmPosX) + " " + hpf(parmPosY) + " Td\n";
        }

        return position;
      };

      for (var lineIndex = 0; lineIndex < da.length; lineIndex++) {
        wordSpacing = "";

        switch (variant) {
          case ARRAY:
            content = (isHex ? "<" : "(") + da[lineIndex][0] + (isHex ? ">" : ")");
            posX = parseFloat(da[lineIndex][1]);
            posY = parseFloat(da[lineIndex][2]);
            break;

          case STRING:
            content = (isHex ? "<" : "(") + da[lineIndex] + (isHex ? ">" : ")");
            posX = getHorizontalCoordinate(x);
            posY = getVerticalCoordinate(y);
            break;
        }

        if (typeof wordSpacingPerLine !== "undefined" && typeof wordSpacingPerLine[lineIndex] !== "undefined") {
          wordSpacing = wordSpacingPerLine[lineIndex] + " Tw\n";
        }

        if (lineIndex === 0) {
          text.push(wordSpacing + generatePosition(posX, posY, transformationMatrix) + content);
        } else if (variant === STRING) {
          text.push(wordSpacing + content);
        } else if (variant === ARRAY) {
          text.push(wordSpacing + generatePosition(posX, posY, transformationMatrix) + content);
        }
      }

      text = variant === STRING ? text.join(" Tj\nT* ") : text.join(" Tj\n");
      text += " Tj\n";
      var result = "BT\n/";
      result += activeFontKey + " " + activeFontSize + " Tf\n"; // font face, style, size

      result += hpf(activeFontSize * lineHeight) + " TL\n"; // line spacing

      result += textColor + "\n";
      result += xtra;
      result += text;
      result += "ET";
      out(result);
      usedFonts[activeFontKey] = true;
      return scope;
    };
    /**
     * Letter spacing method to print text with gaps
     *
     * @function
     * @instance
     * @param {String|Array} text String to be added to the page.
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} spacing Spacing (in units declared at inception)
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name lstext
     * @deprecated We'll be removing this function. It doesn't take character width into account.
     */


    API.__private__.lstext = API.lstext = function (text, x, y, charSpace) {
      return this.text(text, x, y, {
        charSpace: charSpace
      });
    }; // PDF supports these path painting and clip path operators:
    //
    // S - stroke
    // s - close/stroke
    // f (F) - fill non-zero
    // f* - fill evenodd
    // B - fill stroke nonzero
    // B* - fill stroke evenodd
    // b - close fill stroke nonzero
    // b* - close fill stroke evenodd
    // n - nothing (consume path)
    // W - clip nonzero
    // W* - clip evenodd
    //
    // In order to keep the API small, we omit the close-and-fill/stroke operators and provide a separate close()
    // method.

    /**
     *
     * @name clip
     * @function
     * @instance
     * @param {string} rule Only possible value is 'evenodd'
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @description All .clip() after calling drawing ops with a style argument of null.
     */


    var clip = API.__private__.clip = API.clip = function (rule) {
      // Call .clip() after calling drawing ops with a style argument of null
      // W is the PDF clipping op
      if ("evenodd" === rule) {
        out("W*");
      } else {
        out("W");
      }

      return this;
    };
    /**
     * @name clipEvenOdd
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @description Modify the current clip path by intersecting it with the current path using the even-odd rule. Note
     * that this will NOT consume the current path. In order to only use this path for clipping call
     * {@link API.discardPath} afterwards.
     */


    API.clipEvenOdd = function () {
      return clip("evenodd");
    };
    /**
     * This fixes the previous function clip(). Perhaps the 'stroke path' hack was due to the missing 'n' instruction?
     * We introduce the fixed version so as to not break API.
     * @param fillRule
     * @deprecated
     * @ignore
     */


    API.__private__.clip_fixed = API.clip_fixed = function (rule) {
      return API.clip(rule);
    };
    /**
     * Consumes the current path without any effect. Mainly used in combination with {@link clip} or
     * {@link clipEvenOdd}. The PDF "n" operator.
     * @name discardPath
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.__private__.discardPath = API.discardPath = function () {
      out("n");
      return this;
    };

    var isValidStyle = API.__private__.isValidStyle = function (style) {
      var validStyleVariants = [undefined, null, "S", "D", "F", "DF", "FD", "f", "f*", "B", "B*", "n"];
      var result = false;

      if (validStyleVariants.indexOf(style) !== -1) {
        result = true;
      }

      return result;
    };

    API.__private__.setDefaultPathOperation = API.setDefaultPathOperation = function (operator) {
      if (isValidStyle(operator)) {
        defaultPathOperation = operator;
      }

      return this;
    };

    var getStyle = API.__private__.getStyle = API.getStyle = function (style) {
      // see path-painting operators in PDF spec
      var op = defaultPathOperation; // stroke

      switch (style) {
        case "D":
        case "S":
          op = "S"; // stroke

          break;

        case "F":
          op = "f"; // fill

          break;

        case "FD":
        case "DF":
          op = "B";
          break;

        case "f":
        case "f*":
        case "B":
        case "B*":
          /*
               Allow direct use of these PDF path-painting operators:
               - f    fill using nonzero winding number rule
               - f*    fill using even-odd rule
               - B    fill then stroke with fill using non-zero winding number rule
               - B*    fill then stroke with fill using even-odd rule
               */
          op = style;
          break;
      }

      return op;
    };
    /**
     * Close the current path. The PDF "h" operator.
     * @name close
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    var close = API.close = function () {
      out("h");
      return this;
    };
    /**
     * Stroke the path. The PDF "S" operator.
     * @name stroke
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.stroke = function () {
      out("S");
      return this;
    };
    /**
     * Fill the current path using the nonzero winding number rule. If a pattern is provided, the path will be filled
     * with this pattern, otherwise with the current fill color. Equivalent to the PDF "f" operator.
     * @name fill
     * @function
     * @instance
     * @param {PatternData=} pattern If provided the path will be filled with this pattern
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.fill = function (pattern) {
      fillWithOptionalPattern("f", pattern);
      return this;
    };
    /**
     * Fill the current path using the even-odd rule. The PDF f* operator.
     * @see API.fill
     * @name fillEvenOdd
     * @function
     * @instance
     * @param {PatternData=} pattern If provided the path will be filled with this pattern
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.fillEvenOdd = function (pattern) {
      fillWithOptionalPattern("f*", pattern);
      return this;
    };
    /**
     * Fill using the nonzero winding number rule and then stroke the current Path. The PDF "B" operator.
     * @see API.fill
     * @name fillStroke
     * @function
     * @instance
     * @param {PatternData=} pattern If provided the path will be stroked with this pattern
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.fillStroke = function (pattern) {
      fillWithOptionalPattern("B", pattern);
      return this;
    };
    /**
     * Fill using the even-odd rule and then stroke the current Path. The PDF "B" operator.
     * @see API.fill
     * @name fillStrokeEvenOdd
     * @function
     * @instance
     * @param {PatternData=} pattern If provided the path will be fill-stroked with this pattern
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.fillStrokeEvenOdd = function (pattern) {
      fillWithOptionalPattern("B*", pattern);
      return this;
    };

    var fillWithOptionalPattern = function fillWithOptionalPattern(style, pattern) {
      if (_typeof(pattern) === "object") {
        fillWithPattern(pattern, style);
      } else {
        out(style);
      }
    };

    var putStyle = function putStyle(style, patternKey, patternData) {
      if (style === null || apiMode === ApiMode.ADVANCED && style === undefined) {
        return;
      }

      style = getStyle(style); // stroking / filling / both the path

      if (!patternKey) {
        out(style);
        return;
      }

      if (!patternData) {
        patternData = {
          matrix: identityMatrix
        };
      }

      if (patternData instanceof Matrix) {
        patternData = {
          matrix: patternData
        };
      }

      patternData.key = patternKey;
      patternData || (patternData = identityMatrix);
      fillWithPattern(patternData, style);
    };

    var fillWithPattern = function fillWithPattern(patternData, style) {
      var patternId = patternMap[patternData.key];
      var pattern = patterns[patternId];

      if (pattern instanceof API.ShadingPattern) {
        out("q");
        out(clipRuleFromStyle(style));

        if (pattern.gState) {
          API.setGState(pattern.gState);
        }

        out(patternData.matrix.toString() + " cm");
        out("/" + patternId + " sh");
        out("Q");
      } else if (pattern instanceof API.TilingPattern) {
        // pdf draws patterns starting at the bottom left corner and they are not affected by the global transformation,
        // so we must flip them
        var matrix = new Matrix(1, 0, 0, -1, 0, getPageHeight());

        if (patternData.matrix) {
          matrix = matrix.multiply(patternData.matrix || identityMatrix); // we cannot apply a matrix to the pattern on use so we must abuse the pattern matrix and create new instances
          // for each use

          patternId = pattern.createClone(patternData.key, patternData.boundingBox, patternData.xStep, patternData.yStep, matrix).id;
        }

        out("q");
        out("/Pattern cs");
        out("/" + patternId + " scn");

        if (pattern.gState) {
          API.setGState(pattern.gState);
        }

        out(style);
        out("Q");
      }
    };

    var clipRuleFromStyle = function clipRuleFromStyle(style) {
      switch (style) {
        case "f":
        case "F":
          return "W n";

        case "f*":
          return "W* n";

        case "B":
          return "W S";

        case "B*":
          return "W* S";
        // these two are for compatibility reasons (in the past, calling any primitive method with a shading pattern
        // and "n"/"S" as style would still fill/fill and stroke the path)

        case "S":
          return "W S";

        case "n":
          return "W n";
      }
    };
    /**
     * Begin a new subpath by moving the current point to coordinates (x, y). The PDF "m" operator.
     * @param {number} x
     * @param {number} y
     * @name moveTo
     * @function
     * @instance
     * @memberof jsPDF#
     * @returns {jsPDF}
     */


    var moveTo = API.moveTo = function (x, y) {
      out(hpf(scale(x)) + " " + hpf(transformScaleY(y)) + " m");
      return this;
    };
    /**
     * Append a straight line segment from the current point to the point (x, y). The PDF "l" operator.
     * @param {number} x
     * @param {number} y
     * @memberof jsPDF#
     * @name lineTo
     * @function
     * @instance
     * @memberof jsPDF#
     * @returns {jsPDF}
     */


    var lineTo = API.lineTo = function (x, y) {
      out(hpf(scale(x)) + " " + hpf(transformScaleY(y)) + " l");
      return this;
    };
    /**
     * Append a cubic Bézier curve to the current path. The curve shall extend from the current point to the point
     * (x3, y3), using (x1, y1) and (x2, y2) as Bézier control points. The new current point shall be (x3, x3).
     * @param {number} x1
     * @param {number} y1
     * @param {number} x2
     * @param {number} y2
     * @param {number} x3
     * @param {number} y3
     * @memberof jsPDF#
     * @name curveTo
     * @function
     * @instance
     * @memberof jsPDF#
     * @returns {jsPDF}
     */


    var curveTo = API.curveTo = function (x1, y1, x2, y2, x3, y3) {
      out([hpf(scale(x1)), hpf(transformScaleY(y1)), hpf(scale(x2)), hpf(transformScaleY(y2)), hpf(scale(x3)), hpf(transformScaleY(y3)), "c"].join(" "));
      return this;
    };
    /**
     * Draw a line on the current page.
     *
     * @name line
     * @function
     * @instance
     * @param {number} x1
     * @param {number} y1
     * @param {number} x2
     * @param {number} y2
     * @param {string} style A string specifying the painting style or null.  Valid styles include: 'S' [default] - stroke, 'F' - fill,  and 'DF' (or 'FD') -  fill then stroke. A null value postpones setting the style so that a shape may be composed using multiple method calls. The last drawing method call used to define the shape should not have a null style argument. default: 'S'
     * @returns {jsPDF}
     * @memberof jsPDF#
     */


    API.__private__.line = API.line = function (x1, y1, x2, y2, style) {
      if (isNaN(x1) || isNaN(y1) || isNaN(x2) || isNaN(y2) || !isValidStyle(style)) {
        throw new Error("Invalid arguments passed to jsPDF.line");
      }

      if (apiMode === ApiMode.COMPAT) {
        return this.lines([[x2 - x1, y2 - y1]], x1, y1, [1, 1], style || "S");
      } else {
        return this.lines([[x2 - x1, y2 - y1]], x1, y1, [1, 1]).stroke();
      }
    };
    /**
     * @typedef {Object} PatternData
     * {Matrix|undefined} matrix
     * {Number|undefined} xStep
     * {Number|undefined} yStep
     * {Array.<Number>|undefined} boundingBox
     */

    /**
     * Adds series of curves (straight lines or cubic bezier curves) to canvas, starting at `x`, `y` coordinates.
     * All data points in `lines` are relative to last line origin.
     * `x`, `y` become x1,y1 for first line / curve in the set.
     * For lines you only need to specify [x2, y2] - (ending point) vector against x1, y1 starting point.
     * For bezier curves you need to specify [x2,y2,x3,y3,x4,y4] - vectors to control points 1, 2, ending point. All vectors are against the start of the curve - x1,y1.
     *
     * @example .lines([[2,2],[-2,2],[1,1,2,2,3,3],[2,1]], 212,110, [1,1], 'F', false) // line, line, bezier curve, line
     * @param {Array} lines Array of *vector* shifts as pairs (lines) or sextets (cubic bezier curves).
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} scale (Defaults to [1.0,1.0]) x,y Scaling factor for all vectors. Elements can be any floating number Sub-one makes drawing smaller. Over-one grows the drawing. Negative flips the direction.
     * @param {string=} style A string specifying the painting style or null. Valid styles include:
     * 'S' [default] - stroke,
     * 'F' - fill,
     * and 'DF' (or 'FD') -  fill then stroke.
     * In "compat" API mode, a null value postpones setting the style so that a shape may be composed using multiple
     * method calls. The last drawing method call used to define the shape should not have a null style argument.
     *
     * In "advanced" API mode this parameter is deprecated.
     * @param {Boolean=} closed If true, the path is closed with a straight line from the end of the last curve to the starting point.
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the path. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name lines
     */


    API.__private__.lines = API.lines = function (lines, x, y, scale, style, closed, patternKey, patternData) {
      var scalex, scaley, i, l, leg, x2, y2, x3, y3, x4, y4, tmp; // Pre-August-2012 the order of arguments was function(x, y, lines, scale, style)
      // in effort to make all calls have similar signature like
      //   function(content, coordinateX, coordinateY , miscellaneous)
      // this method had its args flipped.
      // code below allows backward compatibility with old arg order.

      if (typeof lines === "number") {
        tmp = y;
        y = x;
        x = lines;
        lines = tmp;
      }

      scale = scale || [1, 1];
      closed = closed || false;

      if (isNaN(x) || isNaN(y) || !Array.isArray(lines) || !Array.isArray(scale) || !isValidStyle(style) || typeof closed !== "boolean") {
        throw new Error("Invalid arguments passed to jsPDF.lines");
      } // starting point


      moveTo(x, y);
      scalex = scale[0];
      scaley = scale[1];
      l = lines.length; //, x2, y2 // bezier only. In page default measurement "units", *after* scaling
      //, x3, y3 // bezier only. In page default measurement "units", *after* scaling
      // ending point for all, lines and bezier. . In page default measurement "units", *after* scaling

      x4 = x; // last / ending point = starting point for first item.

      y4 = y; // last / ending point = starting point for first item.

      for (i = 0; i < l; i++) {
        leg = lines[i];

        if (leg.length === 2) {
          // simple line
          x4 = leg[0] * scalex + x4; // here last x4 was prior ending point

          y4 = leg[1] * scaley + y4; // here last y4 was prior ending point

          lineTo(x4, y4);
        } else {
          // bezier curve
          x2 = leg[0] * scalex + x4; // here last x4 is prior ending point

          y2 = leg[1] * scaley + y4; // here last y4 is prior ending point

          x3 = leg[2] * scalex + x4; // here last x4 is prior ending point

          y3 = leg[3] * scaley + y4; // here last y4 is prior ending point

          x4 = leg[4] * scalex + x4; // here last x4 was prior ending point

          y4 = leg[5] * scaley + y4; // here last y4 was prior ending point

          curveTo(x2, y2, x3, y3, x4, y4);
        }
      }

      if (closed) {
        close();
      }

      putStyle(style, patternKey, patternData);
      return this;
    };
    /**
     * Similar to {@link API.lines} but all coordinates are interpreted as absolute coordinates instead of relative.
     * @param {Array<Object>} lines An array of {op: operator, c: coordinates} object, where op is one of "m" (move to), "l" (line to)
     * "c" (cubic bezier curve) and "h" (close (sub)path)). c is an array of coordinates. "m" and "l" expect two, "c"
     * six and "h" an empty array (or undefined).
     * @param {String=} style  The style. Deprecated!
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the path. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name path
     */


    API.path = function (lines, style, patternKey, patternData) {
      for (var i = 0; i < lines.length; i++) {
        var leg = lines[i];
        var coords = leg.c;

        switch (leg.op) {
          case "m":
            moveTo(coords[0], coords[1]);
            break;

          case "l":
            lineTo(coords[0], coords[1]);
            break;

          case "c":
            curveTo.apply(this, coords);
            break;

          case "h":
            close();
            break;
        }
      }

      putStyle(style, patternKey, patternData);
      return this;
    };
    /**
     * Adds a rectangle to PDF.
     *
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} w Width (in units declared at inception of PDF document)
     * @param {number} h Height (in units declared at inception of PDF document)
     * @param {string=} style A string specifying the painting style or null. Valid styles include:
     * 'S' [default] - stroke,
     * 'F' - fill,
     * and 'DF' (or 'FD') -  fill then stroke.
     * In "compat" API mode, a null value postpones setting the style so that a shape may be composed using multiple
     * method calls. The last drawing method call used to define the shape should not have a null style argument.
     *
     * In "advanced" API mode this parameter is deprecated.
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the primitive. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name rect
     */


    API.__private__.rect = API.rect = function (x, y, w, h, style, patternKey, patternData) {
      if (isNaN(x) || isNaN(y) || isNaN(w) || isNaN(h) || !isValidStyle(style)) {
        throw new Error("Invalid arguments passed to jsPDF.rect");
      }

      if (apiMode === ApiMode.COMPAT) {
        h = -h;
      }

      out([hpf(scale(x)), hpf(transformScaleY(y)), hpf(scale(w)), hpf(scale(h)), "re"].join(" "));
      putStyle(style, patternKey, patternData);
      return this;
    };
    /**
     * Adds a triangle to PDF.
     *
     * @param {number} x1 Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y1 Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} x2 Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y2 Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} x3 Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y3 Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {string=} style A string specifying the painting style or null. Valid styles include:
     * 'S' [default] - stroke,
     * 'F' - fill,
     * and 'DF' (or 'FD') -  fill then stroke.
     * In "compat" API mode, a null value postpones setting the style so that a shape may be composed using multiple
     * method calls. The last drawing method call used to define the shape should not have a null style argument.
     *
     * In "advanced" API mode this parameter is deprecated.
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the primitive. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name triangle
     */


    API.__private__.triangle = API.triangle = function (x1, y1, x2, y2, x3, y3, style, patternKey, patternData) {
      if (isNaN(x1) || isNaN(y1) || isNaN(x2) || isNaN(y2) || isNaN(x3) || isNaN(y3) || !isValidStyle(style)) {
        throw new Error("Invalid arguments passed to jsPDF.triangle");
      }

      this.lines([[x2 - x1, y2 - y1], // vector to point 2
      [x3 - x2, y3 - y2], // vector to point 3
      [x1 - x3, y1 - y3] // closing vector back to point 1
      ], x1, y1, // start of path
      [1, 1], style, true, patternKey, patternData);
      return this;
    };
    /**
     * Adds a rectangle with rounded corners to PDF.
     *
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} w Width (in units declared at inception of PDF document)
     * @param {number} h Height (in units declared at inception of PDF document)
     * @param {number} rx Radius along x axis (in units declared at inception of PDF document)
     * @param {number} ry Radius along y axis (in units declared at inception of PDF document)
     * @param {string=} style A string specifying the painting style or null. Valid styles include:
     * 'S' [default] - stroke,
     * 'F' - fill,
     * and 'DF' (or 'FD') -  fill then stroke.
     * In "compat" API mode, a null value postpones setting the style so that a shape may be composed using multiple
     * method calls. The last drawing method call used to define the shape should not have a null style argument.
     *
     * In "advanced" API mode this parameter is deprecated.
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the primitive. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name roundedRect
     */


    API.__private__.roundedRect = API.roundedRect = function (x, y, w, h, rx, ry, style, patternKey, patternData) {
      if (isNaN(x) || isNaN(y) || isNaN(w) || isNaN(h) || isNaN(rx) || isNaN(ry) || !isValidStyle(style)) {
        throw new Error("Invalid arguments passed to jsPDF.roundedRect");
      }

      var MyArc = 4 / 3 * (Math.SQRT2 - 1);
      rx = Math.min(rx, w * 0.5);
      ry = Math.min(ry, h * 0.5);
      this.lines([[w - 2 * rx, 0], [rx * MyArc, 0, rx, ry - ry * MyArc, rx, ry], [0, h - 2 * ry], [0, ry * MyArc, -(rx * MyArc), ry, -rx, ry], [-w + 2 * rx, 0], [-(rx * MyArc), 0, -rx, -(ry * MyArc), -rx, -ry], [0, -h + 2 * ry], [0, -(ry * MyArc), rx * MyArc, -ry, rx, -ry]], x + rx, y, // start of path
      [1, 1], style, true, patternKey, patternData);
      return this;
    };
    /**
     * Adds an ellipse to PDF.
     *
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} rx Radius along x axis (in units declared at inception of PDF document)
     * @param {number} ry Radius along y axis (in units declared at inception of PDF document)
     * @param {string=} style A string specifying the painting style or null. Valid styles include:
     * 'S' [default] - stroke,
     * 'F' - fill,
     * and 'DF' (or 'FD') -  fill then stroke.
     * In "compat" API mode, a null value postpones setting the style so that a shape may be composed using multiple
     * method calls. The last drawing method call used to define the shape should not have a null style argument.
     *
     * In "advanced" API mode this parameter is deprecated.
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the primitive. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name ellipse
     */


    API.__private__.ellipse = API.ellipse = function (x, y, rx, ry, style, patternKey, patternData) {
      if (isNaN(x) || isNaN(y) || isNaN(rx) || isNaN(ry) || !isValidStyle(style)) {
        throw new Error("Invalid arguments passed to jsPDF.ellipse");
      }

      var lx = 4 / 3 * (Math.SQRT2 - 1) * rx,
          ly = 4 / 3 * (Math.SQRT2 - 1) * ry;
      moveTo(x + rx, y);
      curveTo(x + rx, y - ly, x + lx, y - ry, x, y - ry);
      curveTo(x - lx, y - ry, x - rx, y - ly, x - rx, y);
      curveTo(x - rx, y + ly, x - lx, y + ry, x, y + ry);
      curveTo(x + lx, y + ry, x + rx, y + ly, x + rx, y);
      putStyle(style, patternKey, patternData);
      return this;
    };
    /**
     * Adds an circle to PDF.
     *
     * @param {number} x Coordinate (in units declared at inception of PDF document) against left edge of the page
     * @param {number} y Coordinate (in units declared at inception of PDF document) against upper edge of the page
     * @param {number} r Radius (in units declared at inception of PDF document)
     * @param {string=} style A string specifying the painting style or null. Valid styles include:
     * 'S' [default] - stroke,
     * 'F' - fill,
     * and 'DF' (or 'FD') -  fill then stroke.
     * In "compat" API mode, a null value postpones setting the style so that a shape may be composed using multiple
     * method calls. The last drawing method call used to define the shape should not have a null style argument.
     *
     * In "advanced" API mode this parameter is deprecated.
     * @param {String=} patternKey The pattern key for the pattern that should be used to fill the primitive. Deprecated!
     * @param {(Matrix|PatternData)=} patternData The matrix that transforms the pattern into user space, or an object that
     * will modify the pattern on use. Deprecated!
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name circle
     */


    API.__private__.circle = API.circle = function (x, y, r, style, patternKey, patternData) {
      if (isNaN(x) || isNaN(y) || isNaN(r) || !isValidStyle(style)) {
        throw new Error("Invalid arguments passed to jsPDF.circle");
      }

      return this.ellipse(x, y, r, r, style, patternKey, patternData);
    };
    /**
     * Sets text font face, variant for upcoming text elements.
     * See output of jsPDF.getFontList() for possible font names, styles.
     *
     * @param {string} fontName Font name or family. Example: "times".
     * @param {string} fontStyle Font style or variant. Example: "italic".
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setFont
     */


    API.setFont = function (fontName, fontStyle) {
      activeFontKey = getFont(fontName, fontStyle, {
        disableWarning: false
      });
      return this;
    };
    /**
     * Gets text font face, variant for upcoming text elements.
     *
     * @function
     * @instance
     * @returns {Object}
     * @memberof jsPDF#
     * @name getFont
     */


    var getFontEntry = API.__private__.getFont = API.getFont = function () {
      return fonts[getFont.apply(API, arguments)];
    };
    /**
     * Switches font style or variant for upcoming text elements,
     * while keeping the font face or family same.
     * See output of jsPDF.getFontList() for possible font names, styles.
     *
     * @param {string} style Font style or variant. Example: "italic".
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @deprecated
     * @name setFontStyle
     */


    API.setFontStyle = API.setFontType = function (style) {
      activeFontKey = getFont(undefined, style); // if font is not found, the above line blows up and we never go further

      return this;
    };
    /**
     * Returns an object - a tree of fontName to fontStyle relationships available to
     * active PDF document.
     *
     * @public
     * @function
     * @instance
     * @returns {Object} Like {'times':['normal', 'italic', ... ], 'arial':['normal', 'bold', ... ], ... }
     * @memberof jsPDF#
     * @name getFontList
     */


    API.__private__.getFontList = API.getFontList = function () {
      var list = {},
          fontName,
          fontStyle;

      for (fontName in fontmap) {
        if (fontmap.hasOwnProperty(fontName)) {
          list[fontName] = [];

          for (fontStyle in fontmap[fontName]) {
            if (fontmap[fontName].hasOwnProperty(fontStyle)) {
              list[fontName].push(fontStyle);
            }
          }
        }
      }

      return list;
    };
    /**
     * Add a custom font to the current instance.
     *
     * @property {string} postScriptName PDF specification full name for the font.
     * @property {string} id PDF-document-instance-specific label assinged to the font.
     * @property {string} fontStyle Style of the Font.
     * @property {Object} encoding Encoding_name-to-Font_metrics_object mapping.
     * @function
     * @instance
     * @memberof jsPDF#
     * @name addFont
     * @returns {string} fontId
     */


    API.addFont = function (postScriptName, fontName, fontStyle, encoding) {
      encoding = encoding || "Identity-H";
      return addFont.call(this, postScriptName, fontName, fontStyle, encoding);
    };

    var lineWidth = options.lineWidth || 0.200025; // 2mm

    /**
     * Sets line width for upcoming lines.
     *
     * @param {number} width Line width (in units declared at inception of PDF document).
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setLineWidth
     */

    var setLineWidth = API.__private__.setLineWidth = API.setLineWidth = function (width) {
      out(hpf(scale(width)) + " w");
      return this;
    };
    /**
     * Sets the dash pattern for upcoming lines.
     *
     * To reset the settings simply call the method without any parameters.
     * @param {Array<number>} dashArray An array containing 0-2 numbers. The first number sets the length of the
     * dashes, the second number the length of the gaps. If the second number is missing, the gaps are considered
     * to be as long as the dashes. An empty array means solid, unbroken lines.
     * @param {number} dashPhase The phase lines start with.
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setLineDashPattern
     */


    API.__private__.setLineDash = jsPDF.API.setLineDash = jsPDF.API.setLineDashPattern = function (dashArray, dashPhase) {
      dashArray = dashArray || [];
      dashPhase = dashPhase || 0;

      if (isNaN(dashPhase) || !Array.isArray(dashArray)) {
        throw new Error("Invalid arguments passed to jsPDF.setLineDash");
      }

      dashArray = dashArray.map(function (x) {
        return hpf(scale(x));
      }).join(" ");
      dashPhase = hpf(scale(dashPhase));
      out("[" + dashArray + "] " + dashPhase + " d");
      return this;
    };

    var lineHeightFactor;

    var getLineHeight = API.__private__.getLineHeight = API.getLineHeight = function () {
      return activeFontSize * lineHeightFactor;
    };

    API.__private__.getLineHeight = API.getLineHeight = function () {
      return activeFontSize * lineHeightFactor;
    };
    /**
     * Sets the LineHeightFactor of proportion.
     *
     * @param {number} value LineHeightFactor value. Default: 1.15.
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setLineHeightFactor
     */


    var setLineHeightFactor = API.__private__.setLineHeightFactor = API.setLineHeightFactor = function (value) {
      value = value || 1.15;

      if (typeof value === "number") {
        lineHeightFactor = value;
      }

      return this;
    };
    /**
     * Gets the LineHeightFactor, default: 1.15.
     *
     * @function
     * @instance
     * @returns {number} lineHeightFactor
     * @memberof jsPDF#
     * @name getLineHeightFactor
     */


    var getLineHeightFactor = API.__private__.getLineHeightFactor = API.getLineHeightFactor = function () {
      return lineHeightFactor;
    };

    setLineHeightFactor(options.lineHeight);

    var getHorizontalCoordinate = API.__private__.getHorizontalCoordinate = function (value) {
      return scale(value);
    };

    var getVerticalCoordinate = API.__private__.getVerticalCoordinate = function (value) {
      if (apiMode === ApiMode.ADVANCED) {
        return value;
      } else {
        var pageHeight = pagesContext[currentPage].mediaBox.topRightY - pagesContext[currentPage].mediaBox.bottomLeftY;
        return pageHeight - scale(value);
      }
    };

    var getHorizontalCoordinateString = API.__private__.getHorizontalCoordinateString = API.getHorizontalCoordinateString = function (value) {
      return hpf(getHorizontalCoordinate(value));
    };

    var getVerticalCoordinateString = API.__private__.getVerticalCoordinateString = API.getVerticalCoordinateString = function (value) {
      return hpf(getVerticalCoordinate(value));
    };

    var strokeColor = options.strokeColor || "0 G";
    /**
     *  Gets the stroke color for upcoming elements.
     *
     * @function
     * @instance
     * @returns {string} colorAsHex
     * @memberof jsPDF#
     * @name getDrawColor
     */

    API.__private__.getStrokeColor = API.getDrawColor = function () {
      return decodeColorString(strokeColor);
    };
    /**
     * Sets the stroke color for upcoming elements.
     *
     * Depending on the number of arguments given, Gray, RGB, or CMYK
     * color space is implied.
     *
     * When only ch1 is given, "Gray" color space is implied and it
     * must be a value in the range from 0.00 (solid black) to to 1.00 (white)
     * if values are communicated as String types, or in range from 0 (black)
     * to 255 (white) if communicated as Number type.
     * The RGB-like 0-255 range is provided for backward compatibility.
     *
     * When only ch1,ch2,ch3 are given, "RGB" color space is implied and each
     * value must be in the range from 0.00 (minimum intensity) to to 1.00
     * (max intensity) if values are communicated as String types, or
     * from 0 (min intensity) to to 255 (max intensity) if values are communicated
     * as Number types.
     * The RGB-like 0-255 range is provided for backward compatibility.
     *
     * When ch1,ch2,ch3,ch4 are given, "CMYK" color space is implied and each
     * value must be a in the range from 0.00 (0% concentration) to to
     * 1.00 (100% concentration)
     *
     * Because JavaScript treats fixed point numbers badly (rounds to
     * floating point nearest to binary representation) it is highly advised to
     * communicate the fractional numbers as String types, not JavaScript Number type.
     *
     * @param {Number|String} ch1 Color channel value or {string} ch1 color value in hexadecimal, example: '#FFFFFF'.
     * @param {Number} ch2 Color channel value.
     * @param {Number} ch3 Color channel value.
     * @param {Number} ch4 Color channel value.
     *
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setDrawColor
     */


    API.__private__.setStrokeColor = API.setDrawColor = function (ch1, ch2, ch3, ch4) {
      var options = {
        ch1: ch1,
        ch2: ch2,
        ch3: ch3,
        ch4: ch4,
        pdfColorType: "draw",
        precision: 2
      };
      strokeColor = encodeColorString(options);
      out(strokeColor);
      return this;
    };

    var fillColor = options.fillColor || "0 g";
    /**
     * Gets the fill color for upcoming elements.
     *
     * @function
     * @instance
     * @returns {string} colorAsHex
     * @memberof jsPDF#
     * @name getFillColor
     */

    API.__private__.getFillColor = API.getFillColor = function () {
      return decodeColorString(fillColor);
    };
    /**
     * Sets the fill color for upcoming elements.
     *
     * Depending on the number of arguments given, Gray, RGB, or CMYK
     * color space is implied.
     *
     * When only ch1 is given, "Gray" color space is implied and it
     * must be a value in the range from 0.00 (solid black) to to 1.00 (white)
     * if values are communicated as String types, or in range from 0 (black)
     * to 255 (white) if communicated as Number type.
     * The RGB-like 0-255 range is provided for backward compatibility.
     *
     * When only ch1,ch2,ch3 are given, "RGB" color space is implied and each
     * value must be in the range from 0.00 (minimum intensity) to to 1.00
     * (max intensity) if values are communicated as String types, or
     * from 0 (min intensity) to to 255 (max intensity) if values are communicated
     * as Number types.
     * The RGB-like 0-255 range is provided for backward compatibility.
     *
     * When ch1,ch2,ch3,ch4 are given, "CMYK" color space is implied and each
     * value must be a in the range from 0.00 (0% concentration) to to
     * 1.00 (100% concentration)
     *
     * Because JavaScript treats fixed point numbers badly (rounds to
     * floating point nearest to binary representation) it is highly advised to
     * communicate the fractional numbers as String types, not JavaScript Number type.
     *
     * @param {Number|String} ch1 Color channel value or {string} ch1 color value in hexadecimal, example: '#FFFFFF'.
     * @param {Number} ch2 Color channel value.
     * @param {Number} ch3 Color channel value.
     * @param {Number} ch4 Color channel value.
     *
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setFillColor
     */


    API.__private__.setFillColor = API.setFillColor = function (ch1, ch2, ch3, ch4) {
      var options = {
        ch1: ch1,
        ch2: ch2,
        ch3: ch3,
        ch4: ch4,
        pdfColorType: "fill",
        precision: 2
      };
      fillColor = encodeColorString(options);
      out(fillColor);
      return this;
    };

    var textColor = options.textColor || "0 g";
    /**
     * Gets the text color for upcoming elements.
     *
     * @function
     * @instance
     * @returns {string} colorAsHex
     * @memberof jsPDF#
     * @name getTextColor
     */

    var getTextColor = API.__private__.getTextColor = API.getTextColor = function () {
      return decodeColorString(textColor);
    };
    /**
     * Sets the text color for upcoming elements.
     *
     * Depending on the number of arguments given, Gray, RGB, or CMYK
     * color space is implied.
     *
     * When only ch1 is given, "Gray" color space is implied and it
     * must be a value in the range from 0.00 (solid black) to to 1.00 (white)
     * if values are communicated as String types, or in range from 0 (black)
     * to 255 (white) if communicated as Number type.
     * The RGB-like 0-255 range is provided for backward compatibility.
     *
     * When only ch1,ch2,ch3 are given, "RGB" color space is implied and each
     * value must be in the range from 0.00 (minimum intensity) to to 1.00
     * (max intensity) if values are communicated as String types, or
     * from 0 (min intensity) to to 255 (max intensity) if values are communicated
     * as Number types.
     * The RGB-like 0-255 range is provided for backward compatibility.
     *
     * When ch1,ch2,ch3,ch4 are given, "CMYK" color space is implied and each
     * value must be a in the range from 0.00 (0% concentration) to to
     * 1.00 (100% concentration)
     *
     * Because JavaScript treats fixed point numbers badly (rounds to
     * floating point nearest to binary representation) it is highly advised to
     * communicate the fractional numbers as String types, not JavaScript Number type.
     *
     * @param {Number|String} ch1 Color channel value or {string} ch1 color value in hexadecimal, example: '#FFFFFF'.
     * @param {Number} ch2 Color channel value.
     * @param {Number} ch3 Color channel value.
     * @param {Number} ch4 Color channel value.
     *
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setTextColor
     */


    API.__private__.setTextColor = API.setTextColor = function (ch1, ch2, ch3, ch4) {
      var options = {
        ch1: ch1,
        ch2: ch2,
        ch3: ch3,
        ch4: ch4,
        pdfColorType: "text",
        precision: 3
      };
      textColor = encodeColorString(options);
      return this;
    };

    var activeCharSpace = options.charSpace;
    /**
     * Get global value of CharSpace.
     *
     * @function
     * @instance
     * @returns {number} charSpace
     * @memberof jsPDF#
     * @name getCharSpace
     */

    var getCharSpace = API.__private__.getCharSpace = API.getCharSpace = function () {
      return parseFloat(activeCharSpace || 0);
    };
    /**
     * Set global value of CharSpace.
     *
     * @param {number} charSpace
     * @function
     * @instance
     * @returns {jsPDF} jsPDF-instance
     * @memberof jsPDF#
     * @name setCharSpace
     */


    API.__private__.setCharSpace = API.setCharSpace = function (charSpace) {
      if (isNaN(charSpace)) {
        throw new Error("Invalid argument passed to jsPDF.setCharSpace");
      }

      activeCharSpace = charSpace;
      return this;
    };

    var lineCapID = 0;
    /**
     * Is an Object providing a mapping from human-readable to
     * integer flag values designating the varieties of line cap
     * and join styles.
     *
     * @memberof jsPDF#
     * @name CapJoinStyles
     */

    API.CapJoinStyles = {
      0: 0,
      butt: 0,
      but: 0,
      miter: 0,
      1: 1,
      round: 1,
      rounded: 1,
      circle: 1,
      2: 2,
      projecting: 2,
      project: 2,
      square: 2,
      bevel: 2
    };
    /**
     * Sets the line cap styles.
     * See {jsPDF.CapJoinStyles} for variants.
     *
     * @param {String|Number} style A string or number identifying the type of line cap.
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setLineCap
     */

    API.__private__.setLineCap = API.setLineCap = function (style) {
      var id = API.CapJoinStyles[style];

      if (id === undefined) {
        throw new Error("Line cap style of '" + style + "' is not recognized. See or extend .CapJoinStyles property for valid styles");
      }

      lineCapID = id;
      out(id + " J");
      return this;
    };

    var lineJoinID = 0;
    /**
     * Sets the line join styles.
     * See {jsPDF.CapJoinStyles} for variants.
     *
     * @param {String|Number} style A string or number identifying the type of line join.
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setLineJoin
     */

    API.__private__.setLineJoin = API.setLineJoin = function (style) {
      var id = API.CapJoinStyles[style];

      if (id === undefined) {
        throw new Error("Line join style of '" + style + "' is not recognized. See or extend .CapJoinStyles property for valid styles");
      }

      lineJoinID = id;
      out(id + " j");
      return this;
    };
    /**
     * Sets the miterLimit property, which effects the maximum miter length.
     *
     * @param {number} length The length of the miter
     * @function
     * @instance
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setLineMiterLimit
     */

    API.__private__.setLineMiterLimit = API.__private__.setMiterLimit = API.setLineMiterLimit = API.setMiterLimit = function (length) {
      length = length || 0;

      if (isNaN(length)) {
        throw new Error("Invalid argument passed to jsPDF.setLineMiterLimit");
      }

      out(hpf(scale(length)) + " M");
      return this;
    };
    /**
     * An object representing a pdf graphics state.
     * @class GState
     */

    /**
     *
     * @param parameters A parameter object that contains all properties this graphics state wants to set.
     * Supported are: opacity, stroke-opacity
     * @constructor
     */


    API.GState = function (parameters) {
      /**
       * @name GState#opacity
       * @type {any}
       */

      /**
       * @name GState#stroke-opacity
       * @type {any}
       */
      var supported = "opacity,stroke-opacity".split(",");

      for (var p in parameters) {
        if (parameters.hasOwnProperty(p) && supported.indexOf(p) >= 0) {
          this[p] = parameters[p];
        }
      }
      /**
       * @name GState#id
       * @type {string}
       */


      this.id = ""; // set by addGState()

      /**
       * @name GState#objectNumber
       * @type {number}
       */

      this.objectNumber = -1; // will be set by putGState()
    };

    API.GState.prototype.equals = function equals(other) {
      var ignore = "id,objectNumber,equals";
      var p;
      if (!other || _typeof(other) !== _typeof(this)) { return false; }
      var count = 0;

      for (p in this) {
        if (ignore.indexOf(p) >= 0) { continue; }
        if (this.hasOwnProperty(p) && !other.hasOwnProperty(p)) { return false; }
        if (this[p] !== other[p]) { return false; }
        count++;
      }

      for (p in other) {
        if (other.hasOwnProperty(p) && ignore.indexOf(p) < 0) { count--; }
      }

      return count === 0;
    };
    /**
     * Sets a either previously added {@link GState} (via {@link addGState}) or a new {@link GState}.
     * @param {String|GState} gState If type is string, a previously added GState is used, if type is GState
     * it will be added before use.
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setGState
     */


    API.setGState = function (gState) {
      if (typeof gState === "string") {
        gState = gStates[gStatesMap[gState]];
      } else {
        gState = addGState(null, gState);
      }

      if (!gState.equals(activeGState)) {
        out("/" + gState.id + " gs");
        activeGState = gState;
      }
    };
    /**
     * Adds a new Graphics State. Duplicates are automatically eliminated.
     * @param {String} key Might also be null, if no later reference to this gState is needed
     * @param {Object} gState The gState object
     */


    var addGState = function addGState(key, gState) {
      // only add it if it is not already present (the keys provided by the user must be unique!)
      if (key && gStatesMap[key]) { return; }
      var duplicate = false;

      for (var s in gStates) {
        if (gStates.hasOwnProperty(s)) {
          if (gStates[s].equals(gState)) {
            duplicate = true;
            break;
          }
        }
      }

      if (duplicate) {
        gState = gStates[s];
      } else {
        var gStateKey = "GS" + (Object.keys(gStates).length + 1).toString(10);
        gStates[gStateKey] = gState;
        gState.id = gStateKey;
      } // several user keys may point to the same GState object


      key && (gStatesMap[key] = gState.id);
      events.publish("addGState", gState);
      return gState;
    };
    /**
     * Adds a new {@link GState} for later use. See {@link setGState}.
     * @param {String} key
     * @param {GState} gState
     * @function
     * @instance
     * @returns {jsPDF}
     *
     * @memberof jsPDF#
     * @name addGState
     */


    API.addGState = function (key, gState) {
      addGState(key, gState);
      return this;
    };
    /**
     * Saves the current graphics state ("pushes it on the stack"). It can be restored by {@link restoreGraphicsState}
     * later. Here, the general pdf graphics state is meant, also including the current transformation matrix,
     * fill and stroke colors etc.
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name saveGraphicsState
     */


    API.saveGraphicsState = function () {
      out("q"); // as we cannot set font key and size independently we must keep track of both

      fontStateStack.push({
        key: activeFontKey,
        size: activeFontSize,
        color: textColor
      });
      return this;
    };
    /**
     * Restores a previously saved graphics state saved by {@link saveGraphicsState} ("pops the stack").
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name restoreGraphicsState
     */


    API.restoreGraphicsState = function () {
      out("Q"); // restore previous font state

      var fontState = fontStateStack.pop();
      activeFontKey = fontState.key;
      activeFontSize = fontState.size;
      textColor = fontState.color;
      activeGState = null;
      return this;
    };
    /**
     * Appends this matrix to the left of all previously applied matrices.
     *
     * @param {Matrix} matrix
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name setCurrentTransformationMatrix
     */


    API.setCurrentTransformationMatrix = function (matrix) {
      out(matrix.toString() + " cm");
      return this;
    };
    /**
     * Inserts a debug comment into the generated pdf.
     * @function
     * @instance
     * @param {String} text
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name comment
     */


    API.comment = function (text) {
      out("#" + text);
      return this;
    };
    /**
     * Point
     */


    var Point = function Point(x, y) {
      var _x = x || 0;

      Object.defineProperty(this, "x", {
        enumerable: true,
        get: function get() {
          return _x;
        },
        set: function set(value) {
          if (!isNaN(value)) {
            _x = parseFloat(value);
          }
        }
      });

      var _y = y || 0;

      Object.defineProperty(this, "y", {
        enumerable: true,
        get: function get() {
          return _y;
        },
        set: function set(value) {
          if (!isNaN(value)) {
            _y = parseFloat(value);
          }
        }
      });
      var _type = "pt";
      Object.defineProperty(this, "type", {
        enumerable: true,
        get: function get() {
          return _type;
        },
        set: function set(value) {
          _type = value.toString();
        }
      });
      return this;
    };
    /**
     * Rectangle
     */


    var Rectangle = function Rectangle(x, y, w, h) {
      Point.call(this, x, y);
      this.type = "rect";

      var _w = w || 0;

      Object.defineProperty(this, "w", {
        enumerable: true,
        get: function get() {
          return _w;
        },
        set: function set(value) {
          if (!isNaN(value)) {
            _w = parseFloat(value);
          }
        }
      });

      var _h = h || 0;

      Object.defineProperty(this, "h", {
        enumerable: true,
        get: function get() {
          return _h;
        },
        set: function set(value) {
          if (!isNaN(value)) {
            _h = parseFloat(value);
          }
        }
      });
      return this;
    };
    /**
     * FormObject/RenderTarget
     */


    var RenderTarget = function RenderTarget() {
      this.page = page;
      this.currentPage = currentPage;
      this.pages = pages.slice(0);
      this.pagesContext = pagesContext.slice(0);
      this.x = pageX;
      this.y = pageY;
      this.matrix = pageMatrix;
      this.width = getPageWidth(currentPage);
      this.height = getPageHeight(currentPage);
      this.outputDestination = outputDestination;
      this.id = ""; // set by endFormObject()

      this.objectNumber = -1; // will be set by putXObject()
    };

    RenderTarget.prototype.restore = function () {
      page = this.page;
      currentPage = this.currentPage;
      pagesContext = this.pagesContext;
      pages = this.pages;
      pageX = this.x;
      pageY = this.y;
      pageMatrix = this.matrix;
      setPageWidth(currentPage, this.width);
      setPageHeight(currentPage, this.height);
      outputDestination = this.outputDestination;
    };

    var beginNewRenderTarget = function beginNewRenderTarget(x, y, width, height, matrix) {
      // save current state
      renderTargetStack.push(new RenderTarget()); // clear pages

      page = currentPage = 0;
      pages = [];
      pageX = x;
      pageY = y;
      pageMatrix = matrix;
      beginPage([width, height]);
    };

    var endFormObject = function endFormObject(key) {
      // only add it if it is not already present (the keys provided by the user must be unique!)
      if (renderTargetMap[key]) { return; } // save the created xObject

      var newXObject = new RenderTarget();
      var xObjectId = "Xo" + (Object.keys(renderTargets).length + 1).toString(10);
      newXObject.id = xObjectId;
      renderTargetMap[key] = xObjectId;
      renderTargets[xObjectId] = newXObject;
      events.publish("addFormObject", newXObject); // restore state from stack

      renderTargetStack.pop().restore();
    };
    /**
     * Starts a new pdf form object, which means that all consequent draw calls target a new independent object
     * until {@link endFormObject} is called. The created object can be referenced and drawn later using
     * {@link doFormObject}. Nested form objects are possible.
     * x, y, width, height set the bounding box that is used to clip the content.
     *
     * @param {number} x
     * @param {number} y
     * @param {number} width
     * @param {number} height
     * @param {Matrix} matrix The matrix that will be applied to convert the form objects coordinate system to
     * the parent's.
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name beginFormObject
     */


    API.beginFormObject = function (x, y, width, height, matrix) {
      // The user can set the output target to a new form object. Nested form objects are possible.
      // Currently, they use the resource dictionary of the surrounding stream. This should be changed, as
      // the PDF-Spec states:
      // "In PDF 1.2 and later versions, form XObjects may be independent of the content streams in which
      // they appear, and this is strongly recommended although not requiredIn PDF 1.2 and later versions,
      // form XObjects may be independent of the content streams in which they appear, and this is strongly
      // recommended although not required"
      beginNewRenderTarget(x, y, width, height, matrix);
      return this;
    };
    /**
     * Completes and saves the form object.
     * @param {String} key The key by which this form object can be referenced.
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name endFormObject
     */


    API.endFormObject = function (key) {
      endFormObject(key);
      return this;
    };
    /**
     * Draws the specified form object by referencing to the respective pdf XObject created with
     * {@link API.beginFormObject} and {@link endFormObject}.
     * The location is determined by matrix.
     *
     * @param {String} key The key to the form object.
     * @param {Matrix} matrix The matrix applied before drawing the form object.
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name doFormObject
     */


    API.doFormObject = function (key, matrix) {
      var xObject = renderTargets[renderTargetMap[key]];
      out("q");
      out(matrix.toString() + " cm");
      out("/" + xObject.id + " Do");
      out("Q");
      return this;
    };
    /**
     * Returns the form object specified by key.
     * @param key {String}
     * @returns {{x: number, y: number, width: number, height: number, matrix: Matrix}}
     * @function
     * @returns {jsPDF}
     * @memberof jsPDF#
     * @name getFormObject
     */


    API.getFormObject = function (key) {
      var xObject = renderTargets[renderTargetMap[key]];
      return {
        x: xObject.x,
        y: xObject.y,
        width: xObject.width,
        height: xObject.height,
        matrix: xObject.matrix
      };
    };
    /**
     * Saves as PDF document. An alias of jsPDF.output('save', 'filename.pdf').
     * Uses FileSaver.js-method saveAs.
     *
     * @memberof jsPDF#
     * @name save
     * @function
     * @instance
     * @param  {string} filename The filename including extension.
     * @param  {Object} options An Object with additional options, possible options: 'returnPromise'.
     * @returns {jsPDF} jsPDF-instance
     */


    API.save = function (filename, options) {
      filename = filename || "generated.pdf";
      options = options || {};
      options.returnPromise = options.returnPromise || false;

      if (options.returnPromise === false) {
        saveAs(getBlob(buildDocument()), filename);

        if (typeof saveAs.unload === "function") {
          if (global.setTimeout) {
            setTimeout(saveAs.unload, 911);
          }
        }
      } else {
        return new Promise(function (resolve, reject) {
          try {
            var result = saveAs(getBlob(buildDocument()), filename);

            if (typeof saveAs.unload === "function") {
              if (global.setTimeout) {
                setTimeout(saveAs.unload, 911);
              }
            }

            resolve(result);
          } catch (e) {
            reject(e.message);
          }
        });
      }
    }; // applying plugins (more methods) ON TOP of built-in API.
    // this is intentional as we allow plugins to override
    // built-ins


    for (var plugin in jsPDF.API) {
      if (jsPDF.API.hasOwnProperty(plugin)) {
        if (plugin === "events" && jsPDF.API.events.length) {
          (function (events, newEvents) {
            // jsPDF.API.events is a JS Array of Arrays
            // where each Array is a pair of event name, handler
            // Events were added by plugins to the jsPDF instantiator.
            // These are always added to the new instance and some ran
            // during instantiation.
            var eventname, handler_and_args, i;

            for (i = newEvents.length - 1; i !== -1; i--) {
              // subscribe takes 3 args: 'topic', function, runonce_flag
              // if undefined, runonce is false.
              // users can attach callback directly,
              // or they can attach an array with [callback, runonce_flag]
              // that's what the "apply" magic is for below.
              eventname = newEvents[i][0];
              handler_and_args = newEvents[i][1];
              events.subscribe.apply(events, [eventname].concat(typeof handler_and_args === "function" ? [handler_and_args] : handler_and_args));
            }
          })(events, jsPDF.API.events);
        } else {
          API[plugin] = jsPDF.API[plugin];
        }
      }
    }

    var getPageWidth = API.getPageWidth = function (pageNumber) {
      pageNumber = pageNumber || currentPage;
      return (pagesContext[pageNumber].mediaBox.topRightX - pagesContext[pageNumber].mediaBox.bottomLeftX) / scaleFactor;
    };

    var setPageWidth = API.setPageWidth = function (pageNumber, value) {
      pagesContext[pageNumber].mediaBox.topRightX = value * scaleFactor + pagesContext[pageNumber].mediaBox.bottomLeftX;
    };

    var getPageHeight = API.getPageHeight = function (pageNumber) {
      pageNumber = pageNumber || currentPage;
      return (pagesContext[pageNumber].mediaBox.topRightY - pagesContext[pageNumber].mediaBox.bottomLeftY) / scaleFactor;
    };

    var setPageHeight = API.setPageHeight = function (pageNumber, value) {
      pagesContext[pageNumber].mediaBox.topRightY = value * scaleFactor + pagesContext[pageNumber].mediaBox.bottomLeftY;
    };
    /**
     * Object exposing internal API to plugins
     * @public
     * @ignore
     */


    API.internal = {
      pdfEscape: pdfEscape,
      getStyle: getStyle,
      getFont: getFontEntry,
      getFontSize: getFontSize,
      getCharSpace: getCharSpace,
      getTextColor: getTextColor,
      getLineHeight: getLineHeight,
      getLineHeightFactor: getLineHeightFactor,
      write: write,
      getHorizontalCoordinate: getHorizontalCoordinate,
      getVerticalCoordinate: getVerticalCoordinate,
      getCoordinateString: getHorizontalCoordinateString,
      getVerticalCoordinateString: getVerticalCoordinateString,
      collections: {},
      newObject: newObject,
      newAdditionalObject: newAdditionalObject,
      newObjectDeferred: newObjectDeferred,
      newObjectDeferredBegin: newObjectDeferredBegin,
      getFilters: getFilters,
      putStream: putStream,
      events: events,
      scaleFactor: scaleFactor,
      pageSize: {
        getWidth: function getWidth() {
          return getPageWidth(currentPage);
        },
        setWidth: function setWidth(value) {
          setPageWidth(currentPage, value);
        },
        getHeight: function getHeight() {
          return getPageHeight(currentPage);
        },
        setHeight: function setHeight(value) {
          setPageHeight(currentPage, value);
        }
      },
      output: output,
      getNumberOfPages: getNumberOfPages,
      pages: pages,
      out: out,
      f2: f2,
      f3: f3,
      getPageInfo: getPageInfo,
      getPageInfoByObjId: getPageInfoByObjId,
      getCurrentPageInfo: getCurrentPageInfo,
      getPDFVersion: getPdfVersion,
      Point: Point,
      Rectangle: Rectangle,
      Matrix: Matrix,
      hasHotfix: hasHotfix //Expose the hasHotfix check so plugins can also check them.

    };
    Object.defineProperty(API.internal.pageSize, "width", {
      get: function get() {
        return getPageWidth(currentPage);
      },
      set: function set(value) {
        setPageWidth(currentPage, value);
      },
      enumerable: true,
      configurable: true
    });
    Object.defineProperty(API.internal.pageSize, "height", {
      get: function get() {
        return getPageHeight(currentPage);
      },
      set: function set(value) {
        setPageHeight(currentPage, value);
      },
      enumerable: true,
      configurable: true
    }); //////////////////////////////////////////////////////
    // continuing initialization of jsPDF Document object
    //////////////////////////////////////////////////////
    // Add the first page automatically

    addFonts(standardFonts);
    activeFontKey = "F1";

    _addPage(format, orientation);

    events.publish("initialized");
    return API;
  }
  /**
   * jsPDF.API is a STATIC property of jsPDF class.
   * jsPDF.API is an object you can add methods and properties to.
   * The methods / properties you add will show up in new jsPDF objects.
   *
   * One property is prepopulated. It is the 'events' Object. Plugin authors can add topics,
   * callbacks to this object. These will be reassigned to all new instances of jsPDF.
   *
   * @static
   * @public
   * @memberof jsPDF#
   * @name API
   *
   * @example
   * jsPDF.API.mymethod = function(){
   *   // 'this' will be ref to internal API object. see jsPDF source
   *   // , so you can refer to built-in methods like so:
   *   //     this.line(....)
   *   //     this.text(....)
   * }
   * var pdfdoc = new jsPDF()
   * pdfdoc.mymethod() // <- !!!!!!
   */


  jsPDF.API = {
    events: []
  };
  /**
   * The version of jsPDF.
   * @name version
   * @type {string}
   * @memberof jsPDF#
   */

  jsPDF.version = '2.1.1';

  if (typeof define === "function" && define.amd) {
    define(function () {
      return jsPDF;
    });
  } else if (typeof module !== "undefined" && module.exports) {
    module.exports = jsPDF;
    module.exports.jsPDF = jsPDF;
  } else {
    global.jsPDF = jsPDF;
  }

  return jsPDF;
}(typeof self !== "undefined" && self || typeof window !== "undefined" && window || typeof global !== "undefined" && global || Function('return typeof this === "object" && this.content')() || Function("return this")()); // `self` is undefined in Firefox for Android content script context
// while `this` is nsIContentFrameMessageManager
// with an attribute `content` that corresponds to the window

/* global jsPDF */

/**
 * @license
 * Copyright (c) 2016 Alexander Weidt,
 * https://github.com/BiggA94
 *
 * Licensed under the MIT License. https://opensource.org/licenses/mit-license
 */

/**
 * jsPDF AcroForm Plugin
 * @module AcroForm
 */
(function (jsPDF, globalObj) {

  var jsPDFAPI = jsPDF.API;
  var scope;
  var scaleFactor = 1;

  var pdfEscape = function pdfEscape(value) {
    return value.replace(/\\/g, "\\\\").replace(/\(/g, "\\(").replace(/\)/g, "\\)");
  };

  var pdfUnescape = function pdfUnescape(value) {
    return value.replace(/\\\\/g, "\\").replace(/\\\(/g, "(").replace(/\\\)/g, ")");
  };

  var f2 = function f2(number) {
    return number.toFixed(2); // Ie, %.2f
  };

  var f5 = function f5(number) {
    return number.toFixed(5); // Ie, %.2f
  };

  jsPDFAPI.__acroform__ = {};

  var inherit = function inherit(child, parent) {
    child.prototype = Object.create(parent.prototype);
    child.prototype.constructor = child;
  };

  var scale = function scale(x) {
    return x * scaleFactor;
  };

  var antiScale = function antiScale(x) {
    return x / scaleFactor;
  };

  var createFormXObject = function createFormXObject(formObject) {
    var xobj = new AcroFormXObject();
    var height = AcroFormAppearance.internal.getHeight(formObject) || 0;
    var width = AcroFormAppearance.internal.getWidth(formObject) || 0;
    xobj.BBox = [0, 0, Number(f2(width)), Number(f2(height))];
    return xobj;
  };
  /**
   * Bit-Operations
   */


  var setBit = jsPDFAPI.__acroform__.setBit = function (number, bitPosition) {
    number = number || 0;
    bitPosition = bitPosition || 0;

    if (isNaN(number) || isNaN(bitPosition)) {
      throw new Error("Invalid arguments passed to jsPDF.API.__acroform__.setBit");
    }

    var bitMask = 1 << bitPosition;
    number |= bitMask;
    return number;
  };

  var clearBit = jsPDFAPI.__acroform__.clearBit = function (number, bitPosition) {
    number = number || 0;
    bitPosition = bitPosition || 0;

    if (isNaN(number) || isNaN(bitPosition)) {
      throw new Error("Invalid arguments passed to jsPDF.API.__acroform__.clearBit");
    }

    var bitMask = 1 << bitPosition;
    number &= ~bitMask;
    return number;
  };

  var getBit = jsPDFAPI.__acroform__.getBit = function (number, bitPosition) {
    if (isNaN(number) || isNaN(bitPosition)) {
      throw new Error("Invalid arguments passed to jsPDF.API.__acroform__.getBit");
    }

    return (number & 1 << bitPosition) === 0 ? 0 : 1;
  };
  /*
   * Ff starts counting the bit position at 1 and not like javascript at 0
   */


  var getBitForPdf = jsPDFAPI.__acroform__.getBitForPdf = function (number, bitPosition) {
    if (isNaN(number) || isNaN(bitPosition)) {
      throw new Error("Invalid arguments passed to jsPDF.API.__acroform__.getBitForPdf");
    }

    return getBit(number, bitPosition - 1);
  };

  var setBitForPdf = jsPDFAPI.__acroform__.setBitForPdf = function (number, bitPosition) {
    if (isNaN(number) || isNaN(bitPosition)) {
      throw new Error("Invalid arguments passed to jsPDF.API.__acroform__.setBitForPdf");
    }

    return setBit(number, bitPosition - 1);
  };

  var clearBitForPdf = jsPDFAPI.__acroform__.clearBitForPdf = function (number, bitPosition) {
    if (isNaN(number) || isNaN(bitPosition)) {
      throw new Error("Invalid arguments passed to jsPDF.API.__acroform__.clearBitForPdf");
    }

    return clearBit(number, bitPosition - 1);
  };

  var calculateCoordinates = jsPDFAPI.__acroform__.calculateCoordinates = function (args) {
    var getHorizontalCoordinate = this.internal.getHorizontalCoordinate;
    var getVerticalCoordinate = this.internal.getVerticalCoordinate;
    var x = args[0];
    var y = args[1];
    var w = args[2];
    var h = args[3];
    var coordinates = {};
    coordinates.lowerLeft_X = getHorizontalCoordinate(x) || 0;
    coordinates.lowerLeft_Y = getVerticalCoordinate(y + h) || 0;
    coordinates.upperRight_X = getHorizontalCoordinate(x + w) || 0;
    coordinates.upperRight_Y = getVerticalCoordinate(y) || 0;
    return [Number(f2(coordinates.lowerLeft_X)), Number(f2(coordinates.lowerLeft_Y)), Number(f2(coordinates.upperRight_X)), Number(f2(coordinates.upperRight_Y))];
  };

  var calculateAppearanceStream = function calculateAppearanceStream(formObject) {
    if (formObject.appearanceStreamContent) {
      return formObject.appearanceStreamContent;
    }

    if (!formObject.V && !formObject.DV) {
      return;
    } // else calculate it


    var stream = [];
    var text = formObject.V || formObject.DV;
    var calcRes = calculateX(formObject, text);
    var fontKey = scope.internal.getFont(formObject.fontName, formObject.fontStyle).id; //PDF 32000-1:2008, page 444

    stream.push("/Tx BMC");
    stream.push("q");
    stream.push("BT"); // Begin Text

    stream.push(scope.__private__.encodeColorString(formObject.color));
    stream.push("/" + fontKey + " " + f2(calcRes.fontSize) + " Tf");
    stream.push("1 0 0 1 0 0 Tm"); // Transformation Matrix

    stream.push(calcRes.text);
    stream.push("ET"); // End Text

    stream.push("Q");
    stream.push("EMC");
    var appearanceStreamContent = new createFormXObject(formObject);
    appearanceStreamContent.stream = stream.join("\n");
    return appearanceStreamContent;
  };

  var calculateX = function calculateX(formObject, text) {
    var maxFontSize = formObject.fontSize === 0 ? formObject.maxFontSize : formObject.fontSize;
    var returnValue = {
      text: "",
      fontSize: ""
    }; // Remove Brackets

    text = text.substr(0, 1) == "(" ? text.substr(1) : text;
    text = text.substr(text.length - 1) == ")" ? text.substr(0, text.length - 1) : text; // split into array of words

    var textSplit = text.split(" ");
    var fontSize = maxFontSize; // The Starting fontSize (The Maximum)

    var lineSpacing = 2;
    var borderPadding = 2;
    var height = AcroFormAppearance.internal.getHeight(formObject) || 0;
    height = height < 0 ? -height : height;
    var width = AcroFormAppearance.internal.getWidth(formObject) || 0;
    width = width < 0 ? -width : width;

    var isSmallerThanWidth = function isSmallerThanWidth(i, lastLine, fontSize) {
      if (i + 1 < textSplit.length) {
        var tmp = lastLine + " " + textSplit[i + 1];
        var TextWidth = calculateFontSpace(tmp, formObject, fontSize).width;
        var FieldWidth = width - 2 * borderPadding;
        return TextWidth <= FieldWidth;
      } else {
        return false;
      }
    };

    fontSize++;

    FontSize: while (fontSize > 0) {
      text = "";
      fontSize--;
      var textHeight = calculateFontSpace("3", formObject, fontSize).height;
      var startY = formObject.multiline ? height - fontSize : (height - textHeight) / 2;
      startY += lineSpacing;
      var startX;
      var lastY = startY;
      var firstWordInLine = 0,
          lastWordInLine = 0;
      var lastLength;

      if (fontSize <= 0) {
        // In case, the Text doesn't fit at all
        fontSize = 12;
        text = "(...) Tj\n";
        text += "% Width of Text: " + calculateFontSpace(text, formObject, fontSize).width + ", FieldWidth:" + width + "\n";
        break;
      }

      var lastLine = "";
      var lineCount = 0;

      Line: for (var i in textSplit) {
        if (textSplit.hasOwnProperty(i)) {
          lastLine += textSplit[i] + " "; // Remove last blank

          lastLine = lastLine.substr(lastLine.length - 1) == " " ? lastLine.substr(0, lastLine.length - 1) : lastLine;
          var key = parseInt(i);
          var nextLineIsSmaller = isSmallerThanWidth(key, lastLine, fontSize);
          var isLastWord = i >= textSplit.length - 1;

          if (nextLineIsSmaller && !isLastWord) {
            lastLine += " ";
            continue; // Line
          } else if (!nextLineIsSmaller && !isLastWord) {
            if (!formObject.multiline) {
              continue FontSize;
            } else {
              if ((textHeight + lineSpacing) * (lineCount + 2) + lineSpacing > height) {
                // If the Text is higher than the
                // FieldObject
                continue FontSize;
              }

              lastWordInLine = key; // go on
            }
          } else if (isLastWord) {
            lastWordInLine = key;
          } else {
            if (formObject.multiline && (textHeight + lineSpacing) * (lineCount + 2) + lineSpacing > height) {
              // If the Text is higher than the FieldObject
              continue FontSize;
            }
          }

          var line = "";

          for (var x = firstWordInLine; x <= lastWordInLine; x++) {
            line += textSplit[x] + " ";
          } // Remove last blank


          line = line.substr(line.length - 1) == " " ? line.substr(0, line.length - 1) : line; // lastLength -= blankSpace.width;

          lastLength = calculateFontSpace(line, formObject, fontSize).width; // Calculate startX

          switch (formObject.textAlign) {
            case "right":
              startX = width - lastLength - borderPadding;
              break;

            case "center":
              startX = (width - lastLength) / 2;
              break;

            case "left":
            default:
              startX = borderPadding;
              break;
          }

          text += f2(startX) + " " + f2(lastY) + " Td\n";
          text += "(" + pdfEscape(line) + ") Tj\n"; // reset X in PDF

          text += -f2(startX) + " 0 Td\n"; // After a Line, adjust y position

          lastY = -(fontSize + lineSpacing); // Reset for next iteration step

          lastLength = 0;
          firstWordInLine = lastWordInLine + 1;
          lineCount++;
          lastLine = "";
          continue Line;
        }
      }

      break;
    }

    returnValue.text = text;
    returnValue.fontSize = fontSize;
    return returnValue;
  };
  /**
   * Small workaround for calculating the TextMetric approximately.
   *
   * @param text
   * @param fontsize
   * @returns {TextMetrics} (Has Height and Width)
   */


  var calculateFontSpace = function calculateFontSpace(text, formObject, fontSize) {
    var font = scope.internal.getFont(formObject.fontName, formObject.fontStyle);
    var width = scope.getStringUnitWidth(text, {
      font: font,
      fontSize: parseFloat(fontSize),
      charSpace: 0
    }) * parseFloat(fontSize);
    var height = scope.getStringUnitWidth("3", {
      font: font,
      fontSize: parseFloat(fontSize),
      charSpace: 0
    }) * parseFloat(fontSize) * 1.5;
    return {
      height: height,
      width: width
    };
  };

  var acroformPluginTemplate = {
    fields: [],
    xForms: [],

    /**
     * acroFormDictionaryRoot contains information about the AcroForm
     * Dictionary 0: The Event-Token, the AcroFormDictionaryCallback has
     * 1: The Object ID of the Root
     */
    acroFormDictionaryRoot: null,

    /**
     * After the PDF gets evaluated, the reference to the root has to be
     * reset, this indicates, whether the root has already been printed
     * out
     */
    printedOut: false,
    internal: null,
    isInitialized: false
  };

  var annotReferenceCallback = function annotReferenceCallback() {
    //set objId to undefined and force it to get a new objId on buildDocument
    scope.internal.acroformPlugin.acroFormDictionaryRoot.objId = undefined;
    var fields = scope.internal.acroformPlugin.acroFormDictionaryRoot.Fields;

    for (var i in fields) {
      if (fields.hasOwnProperty(i)) {
        var formObject = fields[i]; //set objId to undefined and force it to get a new objId on buildDocument

        formObject.objId = undefined; // add Annot Reference!

        if (formObject.hasAnnotation) {
          // If theres an Annotation Widget in the Form Object, put the
          // Reference in the /Annot array
          createAnnotationReference.call(scope, formObject);
        }
      }
    }
  };

  var putForm = function putForm(formObject) {
    if (scope.internal.acroformPlugin.printedOut) {
      scope.internal.acroformPlugin.printedOut = false;
      scope.internal.acroformPlugin.acroFormDictionaryRoot = null;
    }

    if (!scope.internal.acroformPlugin.acroFormDictionaryRoot) {
      initializeAcroForm.call(scope);
    }

    scope.internal.acroformPlugin.acroFormDictionaryRoot.Fields.push(formObject);
  };
  /**
   * Create the Reference to the widgetAnnotation, so that it gets referenced
   * in the Annot[] int the+ (Requires the Annotation Plugin)
   */


  var createAnnotationReference = function createAnnotationReference(object) {
    var options = {
      type: "reference",
      object: object
    };

    var findEntry = function findEntry(entry) {
      return entry.type === options.type && entry.object === options.object;
    };

    if (scope.internal.getPageInfo(object.page).pageContext.annotations.find(findEntry) === undefined) {
      scope.internal.getPageInfo(object.page).pageContext.annotations.push(options);
    }
  }; // Callbacks


  var putCatalogCallback = function putCatalogCallback() {
    // Put reference to AcroForm to DocumentCatalog
    if (typeof scope.internal.acroformPlugin.acroFormDictionaryRoot != "undefined") {
      // for safety, shouldn't normally be the case
      scope.internal.write("/AcroForm " + scope.internal.acroformPlugin.acroFormDictionaryRoot.objId + " " + 0 + " R");
    } else {
      throw new Error("putCatalogCallback: Root missing.");
    }
  };
  /**
   * Adds /Acroform X 0 R to Document Catalog, and creates the AcroForm
   * Dictionary
   */


  var AcroFormDictionaryCallback = function AcroFormDictionaryCallback() {
    // Remove event
    scope.internal.events.unsubscribe(scope.internal.acroformPlugin.acroFormDictionaryRoot._eventID);
    delete scope.internal.acroformPlugin.acroFormDictionaryRoot._eventID;
    scope.internal.acroformPlugin.printedOut = true;
  };
  /**
   * Creates the single Fields and writes them into the Document
   *
   * If fieldArray is set, use the fields that are inside it instead of the
   * fields from the AcroRoot (for the FormXObjects...)
   */


  var createFieldCallback = function createFieldCallback(fieldArray) {
    var standardFields = !fieldArray;

    if (!fieldArray) {
      // in case there is no fieldArray specified, we want to print out
      // the Fields of the AcroForm
      // Print out Root
      scope.internal.newObjectDeferredBegin(scope.internal.acroformPlugin.acroFormDictionaryRoot.objId, true);
      scope.internal.acroformPlugin.acroFormDictionaryRoot.putStream();
    }

    fieldArray = fieldArray || scope.internal.acroformPlugin.acroFormDictionaryRoot.Kids;

    for (var i in fieldArray) {
      if (fieldArray.hasOwnProperty(i)) {
        var fieldObject = fieldArray[i];
        var keyValueList = [];
        var oldRect = fieldObject.Rect;

        if (fieldObject.Rect) {
          fieldObject.Rect = calculateCoordinates.call(this, fieldObject.Rect);
        } // Start Writing the Object


        scope.internal.newObjectDeferredBegin(fieldObject.objId, true);
        fieldObject.DA = AcroFormAppearance.createDefaultAppearanceStream(fieldObject);

        if (_typeof(fieldObject) === "object" && typeof fieldObject.getKeyValueListForStream === "function") {
          keyValueList = fieldObject.getKeyValueListForStream();
        }

        fieldObject.Rect = oldRect;

        if (fieldObject.hasAppearanceStream && !fieldObject.appearanceStreamContent) {
          // Calculate Appearance
          var appearance = calculateAppearanceStream.call(this, fieldObject);
          keyValueList.push({
            key: "AP",
            value: "<</N " + appearance + ">>"
          });
          scope.internal.acroformPlugin.xForms.push(appearance);
        } // Assume AppearanceStreamContent is a Array with N,R,D (at least
        // one of them!)


        if (fieldObject.appearanceStreamContent) {
          var appearanceStreamString = ""; // Iterate over N,R and D

          for (var k in fieldObject.appearanceStreamContent) {
            if (fieldObject.appearanceStreamContent.hasOwnProperty(k)) {
              var value = fieldObject.appearanceStreamContent[k];
              appearanceStreamString += "/" + k + " ";
              appearanceStreamString += "<<";

              if (Object.keys(value).length >= 1 || Array.isArray(value)) {
                // appearanceStream is an Array or Object!
                for (var i in value) {
                  if (value.hasOwnProperty(i)) {
                    var obj = value[i];

                    if (typeof obj === "function") {
                      // if Function is referenced, call it in order
                      // to get the FormXObject
                      obj = obj.call(this, fieldObject);
                    }

                    appearanceStreamString += "/" + i + " " + obj + " "; // In case the XForm is already used, e.g. OffState
                    // of CheckBoxes, don't add it

                    if (!(scope.internal.acroformPlugin.xForms.indexOf(obj) >= 0)) { scope.internal.acroformPlugin.xForms.push(obj); }
                  }
                }
              } else {
                obj = value;

                if (typeof obj === "function") {
                  // if Function is referenced, call it in order to
                  // get the FormXObject
                  obj = obj.call(this, fieldObject);
                }

                appearanceStreamString += "/" + i + " " + obj;
                if (!(scope.internal.acroformPlugin.xForms.indexOf(obj) >= 0)) { scope.internal.acroformPlugin.xForms.push(obj); }
              }

              appearanceStreamString += ">>";
            }
          } // appearance stream is a normal Object..


          keyValueList.push({
            key: "AP",
            value: "<<\n" + appearanceStreamString + ">>"
          });
        }

        scope.internal.putStream({
          additionalKeyValues: keyValueList
        });
        scope.internal.out("endobj");
      }
    }

    if (standardFields) {
      createXFormObjectCallback.call(this, scope.internal.acroformPlugin.xForms);
    }
  };

  var createXFormObjectCallback = function createXFormObjectCallback(fieldArray) {
    for (var i in fieldArray) {
      if (fieldArray.hasOwnProperty(i)) {
        var key = i;
        var fieldObject = fieldArray[i]; // Start Writing the Object

        scope.internal.newObjectDeferredBegin(fieldObject && fieldObject.objId, true);

        if (_typeof(fieldObject) === "object" && typeof fieldObject.putStream === "function") {
          fieldObject.putStream();
        }

        delete fieldArray[key];
      }
    }
  };

  var initializeAcroForm = function initializeAcroForm() {
    if (this.internal !== undefined && (this.internal.acroformPlugin === undefined || this.internal.acroformPlugin.isInitialized === false)) {
      scope = this;
      AcroFormField.FieldNum = 0;
      this.internal.acroformPlugin = JSON.parse(JSON.stringify(acroformPluginTemplate));

      if (this.internal.acroformPlugin.acroFormDictionaryRoot) {
        throw new Error("Exception while creating AcroformDictionary");
      }

      scaleFactor = scope.internal.scaleFactor; // The Object Number of the AcroForm Dictionary

      scope.internal.acroformPlugin.acroFormDictionaryRoot = new AcroFormDictionary(); // add Callback for creating the AcroForm Dictionary

      scope.internal.acroformPlugin.acroFormDictionaryRoot._eventID = scope.internal.events.subscribe("postPutResources", AcroFormDictionaryCallback);
      scope.internal.events.subscribe("buildDocument", annotReferenceCallback); // buildDocument
      // Register event, that is triggered when the DocumentCatalog is
      // written, in order to add /AcroForm

      scope.internal.events.subscribe("putCatalog", putCatalogCallback); // Register event, that creates all Fields

      scope.internal.events.subscribe("postPutPages", createFieldCallback);
      scope.internal.acroformPlugin.isInitialized = true;
    }
  }; //PDF 32000-1:2008, page 26, 7.3.6


  var arrayToPdfArray = jsPDFAPI.__acroform__.arrayToPdfArray = function (array) {
    if (Array.isArray(array)) {
      var content = "[";

      for (var i = 0; i < array.length; i++) {
        if (i !== 0) {
          content += " ";
        }

        switch (_typeof(array[i])) {
          case "boolean":
          case "number":
          case "object":
            content += array[i].toString();
            break;

          case "string":
            if (array[i].substr(0, 1) !== "/") {
              content += "(" + pdfEscape(array[i].toString()) + ")";
            } else {
              content += array[i].toString();
            }

            break;
        }
      }

      content += "]";
      return content;
    }

    throw new Error("Invalid argument passed to jsPDF.__acroform__.arrayToPdfArray");
  };

  function getMatches(string, regex, index) {
    index || (index = 1); // default to the first capturing group

    var matches = [];
    var match;

    while (match = regex.exec(string)) {
      matches.push(match[index]);
    }

    return matches;
  }

  var pdfArrayToStringArray = function pdfArrayToStringArray(array) {
    var result = [];

    if (typeof array === "string") {
      result = getMatches(array, /\((.*?)\)/g);
    }

    return result;
  };

  var toPdfString = function toPdfString(string) {
    string = string || "";
    string.toString();
    string = "(" + pdfEscape(string) + ")";
    return string;
  }; // ##########################
  // Classes
  // ##########################

  /**
   * @class AcroFormPDFObject
   * @classdesc A AcroFormPDFObject
   */


  var AcroFormPDFObject = function AcroFormPDFObject() {
    var _objId;
    /**
     * @name AcroFormPDFObject#objId
     * @type {any}
     */


    Object.defineProperty(this, "objId", {
      configurable: true,
      get: function get() {
        if (!_objId) {
          _objId = scope.internal.newObjectDeferred();
        }

        return _objId;
      },
      set: function set(value) {
        _objId = value;
      }
    });
  };
  /**
   * @function AcroFormPDFObject.toString
   */


  AcroFormPDFObject.prototype.toString = function () {
    return this.objId + " 0 R";
  };

  AcroFormPDFObject.prototype.putStream = function () {
    var keyValueList = this.getKeyValueListForStream();
    scope.internal.putStream({
      data: this.stream,
      additionalKeyValues: keyValueList
    });
    scope.internal.out("endobj");
  };
  /**
   * Returns an key-value-List of all non-configurable Variables from the Object
   *
   * @name getKeyValueListForStream
   * @returns {string}
   */


  AcroFormPDFObject.prototype.getKeyValueListForStream = function () {
    var createKeyValueListFromFieldObject = function createKeyValueListFromFieldObject(fieldObject) {
      var keyValueList = [];
      var keys = Object.getOwnPropertyNames(fieldObject).filter(function (key) {
        return key != "content" && key != "appearanceStreamContent" && key.substring(0, 1) != "_";
      });

      for (var i in keys) {
        if (Object.getOwnPropertyDescriptor(fieldObject, keys[i]).configurable === false) {
          var key = keys[i];
          var value = fieldObject[key];

          if (value) {
            if (Array.isArray(value)) {
              keyValueList.push({
                key: key,
                value: arrayToPdfArray(value)
              });
            } else if (value instanceof AcroFormPDFObject) {
              // In case it is a reference to another PDFObject,
              // take the reference number
              keyValueList.push({
                key: key,
                value: value.objId + " 0 R"
              });
            } else if (typeof value !== "function") {
              keyValueList.push({
                key: key,
                value: value
              });
            }
          }
        }
      }

      return keyValueList;
    };

    return createKeyValueListFromFieldObject(this);
  };

  var AcroFormXObject = function AcroFormXObject() {
    AcroFormPDFObject.call(this);
    Object.defineProperty(this, "Type", {
      value: "/XObject",
      configurable: false,
      writeable: true
    });
    Object.defineProperty(this, "Subtype", {
      value: "/Form",
      configurable: false,
      writeable: true
    });
    Object.defineProperty(this, "FormType", {
      value: 1,
      configurable: false,
      writeable: true
    });
    var _BBox = [];
    Object.defineProperty(this, "BBox", {
      configurable: false,
      writeable: true,
      get: function get() {
        return _BBox;
      },
      set: function set(value) {
        _BBox = value;
      }
    });
    Object.defineProperty(this, "Resources", {
      value: "2 0 R",
      configurable: false,
      writeable: true
    });

    var _stream;

    Object.defineProperty(this, "stream", {
      enumerable: false,
      configurable: true,
      set: function set(value) {
        _stream = value.trim();
      },
      get: function get() {
        if (_stream) {
          return _stream;
        } else {
          return null;
        }
      }
    });
  };

  inherit(AcroFormXObject, AcroFormPDFObject);

  var AcroFormDictionary = function AcroFormDictionary() {
    AcroFormPDFObject.call(this);
    var _Kids = [];
    Object.defineProperty(this, "Kids", {
      enumerable: false,
      configurable: true,
      get: function get() {
        if (_Kids.length > 0) {
          return _Kids;
        } else {
          return undefined;
        }
      }
    });
    Object.defineProperty(this, "Fields", {
      enumerable: false,
      configurable: false,
      get: function get() {
        return _Kids;
      }
    }); // Default Appearance

    var _DA;

    Object.defineProperty(this, "DA", {
      enumerable: false,
      configurable: false,
      get: function get() {
        if (!_DA) {
          return undefined;
        }

        return "(" + _DA + ")";
      },
      set: function set(value) {
        _DA = value;
      }
    });
  };

  inherit(AcroFormDictionary, AcroFormPDFObject);
  /**
   * The Field Object contains the Variables, that every Field needs
   *
   * @class AcroFormField
   * @classdesc An AcroForm FieldObject
   */

  var AcroFormField = function AcroFormField() {
    AcroFormPDFObject.call(this); //Annotation-Flag See Table 165

    var _F = 4;
    Object.defineProperty(this, "F", {
      enumerable: false,
      configurable: false,
      get: function get() {
        return _F;
      },
      set: function set(value) {
        if (!isNaN(value)) {
          _F = value;
        } else {
          throw new Error('Invalid value "' + value + '" for attribute F supplied.');
        }
      }
    });
    /**
     * (PDF 1.2) If set, print the annotation when the page is printed. If clear, never print the annotation, regardless of wether is is displayed on the screen.
     * NOTE 2 This can be useful for annotations representing interactive pushbuttons, which would serve no meaningful purpose on the printed page.
     *
     * @name AcroFormField#showWhenPrinted
     * @default true
     * @type {boolean}
     */

    Object.defineProperty(this, "showWhenPrinted", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(_F, 3));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.F = setBitForPdf(_F, 3);
        } else {
          this.F = clearBitForPdf(_F, 3);
        }
      }
    });
    var _Ff = 0;
    Object.defineProperty(this, "Ff", {
      enumerable: false,
      configurable: false,
      get: function get() {
        return _Ff;
      },
      set: function set(value) {
        if (!isNaN(value)) {
          _Ff = value;
        } else {
          throw new Error('Invalid value "' + value + '" for attribute Ff supplied.');
        }
      }
    });
    var _Rect = [];
    Object.defineProperty(this, "Rect", {
      enumerable: false,
      configurable: false,
      get: function get() {
        if (_Rect.length === 0) {
          return undefined;
        }

        return _Rect;
      },
      set: function set(value) {
        if (typeof value !== "undefined") {
          _Rect = value;
        } else {
          _Rect = [];
        }
      }
    });
    /**
     * The x-position of the field.
     *
     * @name AcroFormField#x
     * @default null
     * @type {number}
     */

    Object.defineProperty(this, "x", {
      enumerable: true,
      configurable: true,
      get: function get() {
        if (!_Rect || isNaN(_Rect[0])) {
          return 0;
        }

        return antiScale(_Rect[0]);
      },
      set: function set(value) {
        _Rect[0] = scale(value);
      }
    });
    /**
     * The y-position of the field.
     *
     * @name AcroFormField#y
     * @default null
     * @type {number}
     */

    Object.defineProperty(this, "y", {
      enumerable: true,
      configurable: true,
      get: function get() {
        if (!_Rect || isNaN(_Rect[1])) {
          return 0;
        }

        return antiScale(_Rect[1]);
      },
      set: function set(value) {
        _Rect[1] = scale(value);
      }
    });
    /**
     * The width of the field.
     *
     * @name AcroFormField#width
     * @default null
     * @type {number}
     */

    Object.defineProperty(this, "width", {
      enumerable: true,
      configurable: true,
      get: function get() {
        if (!_Rect || isNaN(_Rect[2])) {
          return 0;
        }

        return antiScale(_Rect[2]);
      },
      set: function set(value) {
        _Rect[2] = scale(value);
      }
    });
    /**
     * The height of the field.
     *
     * @name AcroFormField#height
     * @default null
     * @type {number}
     */

    Object.defineProperty(this, "height", {
      enumerable: true,
      configurable: true,
      get: function get() {
        if (!_Rect || isNaN(_Rect[3])) {
          return 0;
        }

        return antiScale(_Rect[3]);
      },
      set: function set(value) {
        _Rect[3] = scale(value);
      }
    });
    var _FT = "";
    Object.defineProperty(this, "FT", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return _FT;
      },
      set: function set(value) {
        switch (value) {
          case "/Btn":
          case "/Tx":
          case "/Ch":
          case "/Sig":
            _FT = value;
            break;

          default:
            throw new Error('Invalid value "' + value + '" for attribute FT supplied.');
        }
      }
    });
    var _T = null;
    Object.defineProperty(this, "T", {
      enumerable: true,
      configurable: false,
      get: function get() {
        if (!_T || _T.length < 1) {
          // In case of a Child from a Radio´Group, you don't need a FieldName
          if (this instanceof AcroFormChildClass) {
            return undefined;
          }

          _T = "FieldObject" + AcroFormField.FieldNum++;
        }

        return "(" + pdfEscape(_T) + ")";
      },
      set: function set(value) {
        _T = value.toString();
      }
    });
    /**
     * (Optional) The partial field name (see 12.7.3.2, “Field Names”).
     *
     * @name AcroFormField#fieldName
     * @default null
     * @type {string}
     */

    Object.defineProperty(this, "fieldName", {
      configurable: true,
      enumerable: true,
      get: function get() {
        return _T;
      },
      set: function set(value) {
        _T = value;
      }
    });
    var _fontName = "helvetica";
    /**
     * The fontName of the font to be used.
     *
     * @name AcroFormField#fontName
     * @default 'helvetica'
     * @type {string}
     */

    Object.defineProperty(this, "fontName", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _fontName;
      },
      set: function set(value) {
        _fontName = value;
      }
    });
    var _fontStyle = "normal";
    /**
     * The fontStyle of the font to be used.
     *
     * @name AcroFormField#fontStyle
     * @default 'normal'
     * @type {string}
     */

    Object.defineProperty(this, "fontStyle", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _fontStyle;
      },
      set: function set(value) {
        _fontStyle = value;
      }
    });
    var _fontSize = 0;
    /**
     * The fontSize of the font to be used.
     *
     * @name AcroFormField#fontSize
     * @default 0 (for auto)
     * @type {number}
     */

    Object.defineProperty(this, "fontSize", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return antiScale(_fontSize);
      },
      set: function set(value) {
        _fontSize = scale(value);
      }
    });
    var _maxFontSize = 50;
    /**
     * The maximum fontSize of the font to be used.
     *
     * @name AcroFormField#maxFontSize
     * @default 0 (for auto)
     * @type {number}
     */

    Object.defineProperty(this, "maxFontSize", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return antiScale(_maxFontSize);
      },
      set: function set(value) {
        _maxFontSize = scale(value);
      }
    });
    var _color = "black";
    /**
     * The color of the text
     *
     * @name AcroFormField#color
     * @default 'black'
     * @type {string|rgba}
     */

    Object.defineProperty(this, "color", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _color;
      },
      set: function set(value) {
        _color = value;
      }
    });
    var _DA = "/F1 0 Tf 0 g"; // Defines the default appearance (Needed for variable Text)

    Object.defineProperty(this, "DA", {
      enumerable: true,
      configurable: false,
      get: function get() {
        if (!_DA || this instanceof AcroFormChildClass || this instanceof AcroFormTextField) {
          return undefined;
        }

        return toPdfString(_DA);
      },
      set: function set(value) {
        value = value.toString();
        _DA = value;
      }
    });
    var _DV = null;
    Object.defineProperty(this, "DV", {
      enumerable: false,
      configurable: false,
      get: function get() {
        if (!_DV) {
          return undefined;
        }

        if (this instanceof AcroFormButton === false) {
          return toPdfString(_DV);
        }

        return _DV;
      },
      set: function set(value) {
        value = value.toString();

        if (this instanceof AcroFormButton === false) {
          if (value.substr(0, 1) === "(") {
            _DV = pdfUnescape(value.substr(1, value.length - 2));
          } else {
            _DV = pdfUnescape(value);
          }
        } else {
          _DV = value;
        }
      }
    });
    /**
     * (Optional; inheritable) The default value to which the field reverts when a reset-form action is executed (see 12.7.5.3, “Reset-Form Action”). The format of this value is the same as that of value.
     *
     * @name AcroFormField#defaultValue
     * @default null
     * @type {any}
     */

    Object.defineProperty(this, "defaultValue", {
      enumerable: true,
      configurable: true,
      get: function get() {
        if (this instanceof AcroFormButton === true) {
          return pdfUnescape(_DV.substr(1, _DV.length - 1));
        } else {
          return _DV;
        }
      },
      set: function set(value) {
        value = value.toString();

        if (this instanceof AcroFormButton === true) {
          _DV = "/" + value;
        } else {
          _DV = value;
        }
      }
    });
    var _V = null;
    Object.defineProperty(this, "V", {
      enumerable: false,
      configurable: false,
      get: function get() {
        if (!_V) {
          return undefined;
        }

        if (this instanceof AcroFormButton === false) {
          return toPdfString(_V);
        }

        return _V;
      },
      set: function set(value) {
        value = value.toString();

        if (this instanceof AcroFormButton === false) {
          if (value.substr(0, 1) === "(") {
            _V = pdfUnescape(value.substr(1, value.length - 2));
          } else {
            _V = pdfUnescape(value);
          }
        } else {
          _V = value;
        }
      }
    });
    /**
     * (Optional; inheritable) The field’s value, whose format varies depending on the field type. See the descriptions of individual field types for further information.
     *
     * @name AcroFormField#value
     * @default null
     * @type {any}
     */

    Object.defineProperty(this, "value", {
      enumerable: true,
      configurable: true,
      get: function get() {
        if (this instanceof AcroFormButton === true) {
          return pdfUnescape(_V.substr(1, _V.length - 1));
        } else {
          return _V;
        }
      },
      set: function set(value) {
        value = value.toString();

        if (this instanceof AcroFormButton === true) {
          _V = "/" + value;
        } else {
          _V = value;
        }
      }
    });
    /**
     * Check if field has annotations
     *
     * @name AcroFormField#hasAnnotation
     * @readonly
     * @type {boolean}
     */

    Object.defineProperty(this, "hasAnnotation", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return this.Rect;
      }
    });
    Object.defineProperty(this, "Type", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return this.hasAnnotation ? "/Annot" : null;
      }
    });
    Object.defineProperty(this, "Subtype", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return this.hasAnnotation ? "/Widget" : null;
      }
    });
    var _hasAppearanceStream = false;
    /**
     * true if field has an appearanceStream
     *
     * @name AcroFormField#hasAppearanceStream
     * @readonly
     * @type {boolean}
     */

    Object.defineProperty(this, "hasAppearanceStream", {
      enumerable: true,
      configurable: true,
      writeable: true,
      get: function get() {
        return _hasAppearanceStream;
      },
      set: function set(value) {
        value = Boolean(value);
        _hasAppearanceStream = value;
      }
    });
    /**
     * The page on which the AcroFormField is placed
     *
     * @name AcroFormField#page
     * @type {number}
     */

    var _page;

    Object.defineProperty(this, "page", {
      enumerable: true,
      configurable: true,
      writeable: true,
      get: function get() {
        if (!_page) {
          return undefined;
        }

        return _page;
      },
      set: function set(value) {
        _page = value;
      }
    });
    /**
     * If set, the user may not change the value of the field. Any associated widget annotations will not interact with the user; that is, they will not respond to mouse clicks or change their appearance in response to mouse motions. This flag is useful for fields whose values are computed or imported from a database.
     *
     * @name AcroFormField#readOnly
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "readOnly", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 1));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 1);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 1);
        }
      }
    });
    /**
     * If set, the field shall have a value at the time it is exported by a submitform action (see 12.7.5.2, “Submit-Form Action”).
     *
     * @name AcroFormField#required
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "required", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 2));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 2);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 2);
        }
      }
    });
    /**
     * If set, the field shall not be exported by a submit-form action (see 12.7.5.2, “Submit-Form Action”)
     *
     * @name AcroFormField#noExport
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "noExport", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 3));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 3);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 3);
        }
      }
    });
    var _Q = null;
    Object.defineProperty(this, "Q", {
      enumerable: true,
      configurable: false,
      get: function get() {
        if (_Q === null) {
          return undefined;
        }

        return _Q;
      },
      set: function set(value) {
        if ([0, 1, 2].indexOf(value) !== -1) {
          _Q = value;
        } else {
          throw new Error('Invalid value "' + value + '" for attribute Q supplied.');
        }
      }
    });
    /**
     * (Optional; inheritable) A code specifying the form of quadding (justification) that shall be used in displaying the text:
     * 'left', 'center', 'right'
     *
     * @name AcroFormField#textAlign
     * @default 'left'
     * @type {string}
     */

    Object.defineProperty(this, "textAlign", {
      get: function get() {
        var result;

        switch (_Q) {
          case 0:
          default:
            result = "left";
            break;

          case 1:
            result = "center";
            break;

          case 2:
            result = "right";
            break;
        }

        return result;
      },
      configurable: true,
      enumerable: true,
      set: function set(value) {
        switch (value) {
          case "right":
          case 2:
            _Q = 2;
            break;

          case "center":
          case 1:
            _Q = 1;
            break;

          case "left":
          case 0:
          default:
            _Q = 0;
        }
      }
    });
  };

  inherit(AcroFormField, AcroFormPDFObject);
  /**
   * @class AcroFormChoiceField
   * @extends AcroFormField
   */

  var AcroFormChoiceField = function AcroFormChoiceField() {
    AcroFormField.call(this); // Field Type = Choice Field

    this.FT = "/Ch"; // options

    this.V = "()";
    this.fontName = "zapfdingbats"; // Top Index

    var _TI = 0;
    Object.defineProperty(this, "TI", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return _TI;
      },
      set: function set(value) {
        _TI = value;
      }
    });
    /**
     * (Optional) For scrollable list boxes, the top index (the index in the Opt array of the first option visible in the list). Default value: 0.
     *
     * @name AcroFormChoiceField#topIndex
     * @default 0
     * @type {number}
     */

    Object.defineProperty(this, "topIndex", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _TI;
      },
      set: function set(value) {
        _TI = value;
      }
    });
    var _Opt = [];
    Object.defineProperty(this, "Opt", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return arrayToPdfArray(_Opt);
      },
      set: function set(value) {
        _Opt = pdfArrayToStringArray(value);
      }
    });
    /**
     * @memberof AcroFormChoiceField
     * @name getOptions
     * @function
     * @instance
     * @returns {array} array of Options
     */

    this.getOptions = function () {
      return _Opt;
    };
    /**
     * @memberof AcroFormChoiceField
     * @name setOptions
     * @function
     * @instance
     * @param {array} value
     */


    this.setOptions = function (value) {
      _Opt = value;

      if (this.sort) {
        _Opt.sort();
      }
    };
    /**
     * @memberof AcroFormChoiceField
     * @name addOption
     * @function
     * @instance
     * @param {string} value
     */


    this.addOption = function (value) {
      value = value || "";
      value = value.toString();

      _Opt.push(value);

      if (this.sort) {
        _Opt.sort();
      }
    };
    /**
     * @memberof AcroFormChoiceField
     * @name removeOption
     * @function
     * @instance
     * @param {string} value
     * @param {boolean} allEntries (default: false)
     */


    this.removeOption = function (value, allEntries) {
      allEntries = allEntries || false;
      value = value || "";
      value = value.toString();

      while (_Opt.indexOf(value) !== -1) {
        _Opt.splice(_Opt.indexOf(value), 1);

        if (allEntries === false) {
          break;
        }
      }
    };
    /**
     * If set, the field is a combo box; if clear, the field is a list box.
     *
     * @name AcroFormChoiceField#combo
     * @default false
     * @type {boolean}
     */


    Object.defineProperty(this, "combo", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 18));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 18);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 18);
        }
      }
    });
    /**
     * If set, the combo box shall include an editable text box as well as a drop-down list; if clear, it shall include only a drop-down list. This flag shall be used only if the Combo flag is set.
     *
     * @name AcroFormChoiceField#edit
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "edit", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 19));
      },
      set: function set(value) {
        //PDF 32000-1:2008, page 444
        if (this.combo === true) {
          if (Boolean(value) === true) {
            this.Ff = setBitForPdf(this.Ff, 19);
          } else {
            this.Ff = clearBitForPdf(this.Ff, 19);
          }
        }
      }
    });
    /**
     * If set, the field’s option items shall be sorted alphabetically. This flag is intended for use by writers, not by readers. Conforming readers shall display the options in the order in which they occur in the Opt array (see Table 231).
     *
     * @name AcroFormChoiceField#sort
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "sort", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 20));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 20);

          _Opt.sort();
        } else {
          this.Ff = clearBitForPdf(this.Ff, 20);
        }
      }
    });
    /**
     * (PDF 1.4) If set, more than one of the field’s option items may be selected simultaneously; if clear, at most one item shall be selected
     *
     * @name AcroFormChoiceField#multiSelect
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "multiSelect", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 22));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 22);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 22);
        }
      }
    });
    /**
     * (PDF 1.4) If set, text entered in the field shall not be spellchecked. This flag shall not be used unless the Combo and Edit flags are both set.
     *
     * @name AcroFormChoiceField#doNotSpellCheck
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "doNotSpellCheck", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 23));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 23);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 23);
        }
      }
    });
    /**
     * (PDF 1.5) If set, the new value shall be committed as soon as a selection is made (commonly with the pointing device). In this case, supplying a value for a field involves three actions: selecting the field for fill-in, selecting a choice for the fill-in value, and leaving that field, which finalizes or “commits” the data choice and triggers any actions associated with the entry or changing of this data. If this flag is on, then processing does not wait for leaving the field action to occur, but immediately proceeds to the third step.
     * This option enables applications to perform an action once a selection is made, without requiring the user to exit the field. If clear, the new value is not committed until the user exits the field.
     *
     * @name AcroFormChoiceField#commitOnSelChange
     * @default false
     * @type {boolean}
     */

    Object.defineProperty(this, "commitOnSelChange", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 27));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 27);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 27);
        }
      }
    });
    this.hasAppearanceStream = false;
  };

  inherit(AcroFormChoiceField, AcroFormField);
  /**
   * @class AcroFormListBox
   * @extends AcroFormChoiceField
   * @extends AcroFormField
   */

  var AcroFormListBox = function AcroFormListBox() {
    AcroFormChoiceField.call(this);
    this.fontName = "helvetica"; //PDF 32000-1:2008, page 444

    this.combo = false;
  };

  inherit(AcroFormListBox, AcroFormChoiceField);
  /**
   * @class AcroFormComboBox
   * @extends AcroFormListBox
   * @extends AcroFormChoiceField
   * @extends AcroFormField
   */

  var AcroFormComboBox = function AcroFormComboBox() {
    AcroFormListBox.call(this);
    this.combo = true;
  };

  inherit(AcroFormComboBox, AcroFormListBox);
  /**
   * @class AcroFormEditBox
   * @extends AcroFormComboBox
   * @extends AcroFormListBox
   * @extends AcroFormChoiceField
   * @extends AcroFormField
   */

  var AcroFormEditBox = function AcroFormEditBox() {
    AcroFormComboBox.call(this);
    this.edit = true;
  };

  inherit(AcroFormEditBox, AcroFormComboBox);
  /**
   * @class AcroFormButton
   * @extends AcroFormField
   */

  var AcroFormButton = function AcroFormButton() {
    AcroFormField.call(this);
    this.FT = "/Btn";
    /**
     * (Radio buttons only) If set, exactly one radio button shall be selected at all times; selecting the currently selected button has no effect. If clear, clicking the selected button deselects it, leaving no button selected.
     *
     * @name AcroFormButton#noToggleToOff
     * @type {boolean}
     */

    Object.defineProperty(this, "noToggleToOff", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 15));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 15);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 15);
        }
      }
    });
    /**
     * If set, the field is a set of radio buttons; if clear, the field is a checkbox. This flag may be set only if the Pushbutton flag is clear.
     *
     * @name AcroFormButton#radio
     * @type {boolean}
     */

    Object.defineProperty(this, "radio", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 16));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 16);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 16);
        }
      }
    });
    /**
     * If set, the field is a pushbutton that does not retain a permanent value.
     *
     * @name AcroFormButton#pushButton
     * @type {boolean}
     */

    Object.defineProperty(this, "pushButton", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 17));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 17);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 17);
        }
      }
    });
    /**
     * (PDF 1.5) If set, a group of radio buttons within a radio button field that use the same value for the on state will turn on and off in unison; that is if one is checked, they are all checked. If clear, the buttons are mutually exclusive (the same behavior as HTML radio buttons).
     *
     * @name AcroFormButton#radioIsUnison
     * @type {boolean}
     */

    Object.defineProperty(this, "radioIsUnison", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 26));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 26);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 26);
        }
      }
    });
    var _MK = {};
    Object.defineProperty(this, "MK", {
      enumerable: false,
      configurable: false,
      get: function get() {
        if (Object.keys(_MK).length !== 0) {
          var result = [];
          result.push("<<");
          var key;

          for (key in _MK) {
            result.push("/" + key + " (" + _MK[key] + ")");
          }

          result.push(">>");
          return result.join("\n");
        }

        return undefined;
      },
      set: function set(value) {
        if (_typeof(value) === "object") {
          _MK = value;
        }
      }
    });
    /**
     * From the PDF reference:
     * (Optional, button fields only) The widget annotation's normal caption which shall be displayed when it is not interacting with the user.
     * Unlike the remaining entries listed in this Table which apply only to widget annotations associated with pushbutton fields (see Pushbuttons in 12.7.4.2, "Button Fields"), the CA entry may be used with any type of button field, including check boxes (see Check Boxes in 12.7.4.2, "Button Fields") and radio buttons (Radio Buttons in 12.7.4.2, "Button Fields").
     *
     * - '8' = Cross,
     * - 'l' =  Circle,
     * - '' = nothing
     * @name AcroFormButton#caption
     * @type {string}
     */

    Object.defineProperty(this, "caption", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _MK.CA || "";
      },
      set: function set(value) {
        if (typeof value === "string") {
          _MK.CA = value;
        }
      }
    });

    var _AS;

    Object.defineProperty(this, "AS", {
      enumerable: false,
      configurable: false,
      get: function get() {
        return _AS;
      },
      set: function set(value) {
        _AS = value;
      }
    });
    /**
     * (Required if the appearance dictionary AP contains one or more subdictionaries; PDF 1.2) The annotation's appearance state, which selects the applicable appearance stream from an appearance subdictionary (see Section 12.5.5, "Appearance Streams")
     *
     * @name AcroFormButton#appearanceState
     * @type {any}
     */

    Object.defineProperty(this, "appearanceState", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _AS.substr(1, _AS.length - 1);
      },
      set: function set(value) {
        _AS = "/" + value;
      }
    });
  };

  inherit(AcroFormButton, AcroFormField);
  /**
   * @class AcroFormPushButton
   * @extends AcroFormButton
   * @extends AcroFormField
   */

  var AcroFormPushButton = function AcroFormPushButton() {
    AcroFormButton.call(this);
    this.pushButton = true;
  };

  inherit(AcroFormPushButton, AcroFormButton);
  /**
   * @class AcroFormRadioButton
   * @extends AcroFormButton
   * @extends AcroFormField
   */

  var AcroFormRadioButton = function AcroFormRadioButton() {
    AcroFormButton.call(this);
    this.radio = true;
    this.pushButton = false;
    var _Kids = [];
    Object.defineProperty(this, "Kids", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return _Kids;
      },
      set: function set(value) {
        if (typeof value !== "undefined") {
          _Kids = value;
        } else {
          _Kids = [];
        }
      }
    });
  };

  inherit(AcroFormRadioButton, AcroFormButton);
  /**
   * The Child class of a RadioButton (the radioGroup) -> The single Buttons
   *
   * @class AcroFormChildClass
   * @extends AcroFormField
   * @ignore
   */

  var AcroFormChildClass = function AcroFormChildClass() {
    AcroFormField.call(this);

    var _parent;

    Object.defineProperty(this, "Parent", {
      enumerable: false,
      configurable: false,
      get: function get() {
        return _parent;
      },
      set: function set(value) {
        _parent = value;
      }
    });

    var _optionName;

    Object.defineProperty(this, "optionName", {
      enumerable: false,
      configurable: true,
      get: function get() {
        return _optionName;
      },
      set: function set(value) {
        _optionName = value;
      }
    });
    var _MK = {};
    Object.defineProperty(this, "MK", {
      enumerable: false,
      configurable: false,
      get: function get() {
        var result = [];
        result.push("<<");
        var key;

        for (key in _MK) {
          result.push("/" + key + " (" + _MK[key] + ")");
        }

        result.push(">>");
        return result.join("\n");
      },
      set: function set(value) {
        if (_typeof(value) === "object") {
          _MK = value;
        }
      }
    });
    /**
     * From the PDF reference:
     * (Optional, button fields only) The widget annotation's normal caption which shall be displayed when it is not interacting with the user.
     * Unlike the remaining entries listed in this Table which apply only to widget annotations associated with pushbutton fields (see Pushbuttons in 12.7.4.2, "Button Fields"), the CA entry may be used with any type of button field, including check boxes (see Check Boxes in 12.7.4.2, "Button Fields") and radio buttons (Radio Buttons in 12.7.4.2, "Button Fields").
     *
     * - '8' = Cross,
     * - 'l' =  Circle,
     * - '' = nothing
     * @name AcroFormButton#caption
     * @type {string}
     */

    Object.defineProperty(this, "caption", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _MK.CA || "";
      },
      set: function set(value) {
        if (typeof value === "string") {
          _MK.CA = value;
        }
      }
    });

    var _AS;

    Object.defineProperty(this, "AS", {
      enumerable: false,
      configurable: false,
      get: function get() {
        return _AS;
      },
      set: function set(value) {
        _AS = value;
      }
    });
    /**
     * (Required if the appearance dictionary AP contains one or more subdictionaries; PDF 1.2) The annotation's appearance state, which selects the applicable appearance stream from an appearance subdictionary (see Section 12.5.5, "Appearance Streams")
     *
     * @name AcroFormButton#appearanceState
     * @type {any}
     */

    Object.defineProperty(this, "appearanceState", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _AS.substr(1, _AS.length - 1);
      },
      set: function set(value) {
        _AS = "/" + value;
      }
    });
    this.caption = "l";
    this.appearanceState = "Off"; // todo: set AppearanceType as variable that can be set from the
    // outside...

    this._AppearanceType = AcroFormAppearance.RadioButton.Circle; // The Default appearanceType is the Circle

    this.appearanceStreamContent = this._AppearanceType.createAppearanceStream(this.optionName);
  };

  inherit(AcroFormChildClass, AcroFormField);

  AcroFormRadioButton.prototype.setAppearance = function (appearance) {
    if (!("createAppearanceStream" in appearance && "getCA" in appearance)) {
      throw new Error("Couldn't assign Appearance to RadioButton. Appearance was Invalid!");
    }

    for (var objId in this.Kids) {
      if (this.Kids.hasOwnProperty(objId)) {
        var child = this.Kids[objId];
        child.appearanceStreamContent = appearance.createAppearanceStream(child.optionName);
        child.caption = appearance.getCA();
      }
    }
  };

  AcroFormRadioButton.prototype.createOption = function (name) {
    // Create new Child for RadioGroup
    var child = new AcroFormChildClass();
    child.Parent = this;
    child.optionName = name; // Add to Parent

    this.Kids.push(child);
    addField.call(this, child);
    return child;
  };
  /**
   * @class AcroFormCheckBox
   * @extends AcroFormButton
   * @extends AcroFormField
   */


  var AcroFormCheckBox = function AcroFormCheckBox() {
    AcroFormButton.call(this);
    this.fontName = "zapfdingbats";
    this.caption = "3";
    this.appearanceState = "On";
    this.value = "On";
    this.textAlign = "center";
    this.appearanceStreamContent = AcroFormAppearance.CheckBox.createAppearanceStream();
  };

  inherit(AcroFormCheckBox, AcroFormButton);
  /**
   * @class AcroFormTextField
   * @extends AcroFormField
   */

  var AcroFormTextField = function AcroFormTextField() {
    AcroFormField.call(this);
    this.FT = "/Tx";
    /**
     * If set, the field may contain multiple lines of text; if clear, the field’s text shall be restricted to a single line.
     *
     * @name AcroFormTextField#multiline
     * @type {boolean}
     */

    Object.defineProperty(this, "multiline", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 13));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 13);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 13);
        }
      }
    });
    /**
     * (PDF 1.4) If set, the text entered in the field represents the pathname of a file whose contents shall be submitted as the value of the field.
     *
     * @name AcroFormTextField#fileSelect
     * @type {boolean}
     */

    Object.defineProperty(this, "fileSelect", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 21));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 21);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 21);
        }
      }
    });
    /**
     * (PDF 1.4) If set, text entered in the field shall not be spell-checked.
     *
     * @name AcroFormTextField#doNotSpellCheck
     * @type {boolean}
     */

    Object.defineProperty(this, "doNotSpellCheck", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 23));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 23);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 23);
        }
      }
    });
    /**
     * (PDF 1.4) If set, the field shall not scroll (horizontally for single-line fields, vertically for multiple-line fields) to accommodate more text than fits within its annotation rectangle. Once the field is full, no further text shall be accepted for interactive form filling; for noninteractive form filling, the filler should take care not to add more character than will visibly fit in the defined area.
     *
     * @name AcroFormTextField#doNotScroll
     * @type {boolean}
     */

    Object.defineProperty(this, "doNotScroll", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 24));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 24);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 24);
        }
      }
    });
    /**
     * (PDF 1.5) May be set only if the MaxLen entry is present in the text field dictionary (see Table 229) and if the Multiline, Password, and FileSelect flags are clear. If set, the field shall be automatically divided into as many equally spaced positions, or combs, as the value of MaxLen, and the text is laid out into those combs.
     *
     * @name AcroFormTextField#comb
     * @type {boolean}
     */

    Object.defineProperty(this, "comb", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 25));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 25);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 25);
        }
      }
    });
    /**
     * (PDF 1.5) If set, the value of this field shall be a rich text string (see 12.7.3.4, “Rich Text Strings”). If the field has a value, the RV entry of the field dictionary (Table 222) shall specify the rich text string.
     *
     * @name AcroFormTextField#richText
     * @type {boolean}
     */

    Object.defineProperty(this, "richText", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 26));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 26);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 26);
        }
      }
    });
    var _MaxLen = null;
    Object.defineProperty(this, "MaxLen", {
      enumerable: true,
      configurable: false,
      get: function get() {
        return _MaxLen;
      },
      set: function set(value) {
        _MaxLen = value;
      }
    });
    /**
     * (Optional; inheritable) The maximum length of the field’s text, in characters.
     *
     * @name AcroFormTextField#maxLength
     * @type {number}
     */

    Object.defineProperty(this, "maxLength", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return _MaxLen;
      },
      set: function set(value) {
        if (Number.isInteger(value)) {
          _MaxLen = value;
        }
      }
    });
    Object.defineProperty(this, "hasAppearanceStream", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return this.V || this.DV;
      }
    });
  };

  inherit(AcroFormTextField, AcroFormField);
  /**
   * @class AcroFormPasswordField
   * @extends AcroFormTextField
   * @extends AcroFormField
   */

  var AcroFormPasswordField = function AcroFormPasswordField() {
    AcroFormTextField.call(this);
    /**
     * If set, the field is intended for entering a secure password that should not be echoed visibly to the screen. Characters typed from the keyboard shall instead be echoed in some unreadable form, such as asterisks or bullet characters.
     * NOTE To protect password confidentiality, readers should never store the value of the text field in the PDF file if this flag is set.
     *
     * @name AcroFormTextField#password
     * @type {boolean}
     */

    Object.defineProperty(this, "password", {
      enumerable: true,
      configurable: true,
      get: function get() {
        return Boolean(getBitForPdf(this.Ff, 14));
      },
      set: function set(value) {
        if (Boolean(value) === true) {
          this.Ff = setBitForPdf(this.Ff, 14);
        } else {
          this.Ff = clearBitForPdf(this.Ff, 14);
        }
      }
    });
    this.password = true;
  };

  inherit(AcroFormPasswordField, AcroFormTextField); // Contains Methods for creating standard appearances

  var AcroFormAppearance = {
    CheckBox: {
      createAppearanceStream: function createAppearanceStream() {
        var appearance = {
          N: {
            On: AcroFormAppearance.CheckBox.YesNormal
          },
          D: {
            On: AcroFormAppearance.CheckBox.YesPushDown,
            Off: AcroFormAppearance.CheckBox.OffPushDown
          }
        };
        return appearance;
      },

      /**
       * Returns the standard On Appearance for a CheckBox
       *
       * @returns {AcroFormXObject}
       */
      YesPushDown: function YesPushDown(formObject) {
        var xobj = new createFormXObject(formObject);
        var stream = [];
        var fontKey = scope.internal.getFont(formObject.fontName, formObject.fontStyle).id;

        var encodedColor = scope.__private__.encodeColorString(formObject.color);

        var calcRes = calculateX(formObject, formObject.caption);
        stream.push("0.749023 g");
        stream.push("0 0 " + f2(AcroFormAppearance.internal.getWidth(formObject)) + " " + f2(AcroFormAppearance.internal.getHeight(formObject)) + " re");
        stream.push("f");
        stream.push("BMC");
        stream.push("q");
        stream.push("0 0 1 rg");
        stream.push("/" + fontKey + " " + f2(calcRes.fontSize) + " Tf " + encodedColor);
        stream.push("BT");
        stream.push(calcRes.text);
        stream.push("ET");
        stream.push("Q");
        stream.push("EMC");
        xobj.stream = stream.join("\n");
        return xobj;
      },
      YesNormal: function YesNormal(formObject) {
        var xobj = new createFormXObject(formObject);
        var fontKey = scope.internal.getFont(formObject.fontName, formObject.fontStyle).id;

        var encodedColor = scope.__private__.encodeColorString(formObject.color);

        var stream = [];
        var height = AcroFormAppearance.internal.getHeight(formObject);
        var width = AcroFormAppearance.internal.getWidth(formObject);
        var calcRes = calculateX(formObject, formObject.caption);
        stream.push("1 g");
        stream.push("0 0 " + f2(width) + " " + f2(height) + " re");
        stream.push("f");
        stream.push("q");
        stream.push("0 0 1 rg");
        stream.push("0 0 " + f2(width - 1) + " " + f2(height - 1) + " re");
        stream.push("W");
        stream.push("n");
        stream.push("0 g");
        stream.push("BT");
        stream.push("/" + fontKey + " " + f2(calcRes.fontSize) + " Tf " + encodedColor);
        stream.push(calcRes.text);
        stream.push("ET");
        stream.push("Q");
        xobj.stream = stream.join("\n");
        return xobj;
      },

      /**
       * Returns the standard Off Appearance for a CheckBox
       *
       * @returns {AcroFormXObject}
       */
      OffPushDown: function OffPushDown(formObject) {
        var xobj = new createFormXObject(formObject);
        var stream = [];
        stream.push("0.749023 g");
        stream.push("0 0 " + f2(AcroFormAppearance.internal.getWidth(formObject)) + " " + f2(AcroFormAppearance.internal.getHeight(formObject)) + " re");
        stream.push("f");
        xobj.stream = stream.join("\n");
        return xobj;
      }
    },
    RadioButton: {
      Circle: {
        createAppearanceStream: function createAppearanceStream(name) {
          var appearanceStreamContent = {
            D: {
              Off: AcroFormAppearance.RadioButton.Circle.OffPushDown
            },
            N: {}
          };
          appearanceStreamContent.N[name] = AcroFormAppearance.RadioButton.Circle.YesNormal;
          appearanceStreamContent.D[name] = AcroFormAppearance.RadioButton.Circle.YesPushDown;
          return appearanceStreamContent;
        },
        getCA: function getCA() {
          return "l";
        },
        YesNormal: function YesNormal(formObject) {
          var xobj = new createFormXObject(formObject);
          var stream = []; // Make the Radius of the Circle relative to min(height, width) of formObject

          var DotRadius = AcroFormAppearance.internal.getWidth(formObject) <= AcroFormAppearance.internal.getHeight(formObject) ? AcroFormAppearance.internal.getWidth(formObject) / 4 : AcroFormAppearance.internal.getHeight(formObject) / 4; // The Borderpadding...

          DotRadius = Number((DotRadius * 0.9).toFixed(5));
          var c = AcroFormAppearance.internal.Bezier_C;
          var DotRadiusBezier = Number((DotRadius * c).toFixed(5));
          /*
           * The Following is a Circle created with Bezier-Curves.
           */

          stream.push("q");
          stream.push("1 0 0 1 " + f5(AcroFormAppearance.internal.getWidth(formObject) / 2) + " " + f5(AcroFormAppearance.internal.getHeight(formObject) / 2) + " cm");
          stream.push(DotRadius + " 0 m");
          stream.push(DotRadius + " " + DotRadiusBezier + " " + DotRadiusBezier + " " + DotRadius + " 0 " + DotRadius + " c");
          stream.push("-" + DotRadiusBezier + " " + DotRadius + " -" + DotRadius + " " + DotRadiusBezier + " -" + DotRadius + " 0 c");
          stream.push("-" + DotRadius + " -" + DotRadiusBezier + " -" + DotRadiusBezier + " -" + DotRadius + " 0 -" + DotRadius + " c");
          stream.push(DotRadiusBezier + " -" + DotRadius + " " + DotRadius + " -" + DotRadiusBezier + " " + DotRadius + " 0 c");
          stream.push("f");
          stream.push("Q");
          xobj.stream = stream.join("\n");
          return xobj;
        },
        YesPushDown: function YesPushDown(formObject) {
          var xobj = new createFormXObject(formObject);
          var stream = [];
          var DotRadius = AcroFormAppearance.internal.getWidth(formObject) <= AcroFormAppearance.internal.getHeight(formObject) ? AcroFormAppearance.internal.getWidth(formObject) / 4 : AcroFormAppearance.internal.getHeight(formObject) / 4; // The Borderpadding...

          var DotRadius = Number((DotRadius * 0.9).toFixed(5)); // Save results for later use; no need to waste
          // processor ticks on doing math

          var k = Number((DotRadius * 2).toFixed(5));
          var kc = Number((k * AcroFormAppearance.internal.Bezier_C).toFixed(5));
          var dc = Number((DotRadius * AcroFormAppearance.internal.Bezier_C).toFixed(5));
          stream.push("0.749023 g");
          stream.push("q");
          stream.push("1 0 0 1 " + f5(AcroFormAppearance.internal.getWidth(formObject) / 2) + " " + f5(AcroFormAppearance.internal.getHeight(formObject) / 2) + " cm");
          stream.push(k + " 0 m");
          stream.push(k + " " + kc + " " + kc + " " + k + " 0 " + k + " c");
          stream.push("-" + kc + " " + k + " -" + k + " " + kc + " -" + k + " 0 c");
          stream.push("-" + k + " -" + kc + " -" + kc + " -" + k + " 0 -" + k + " c");
          stream.push(kc + " -" + k + " " + k + " -" + kc + " " + k + " 0 c");
          stream.push("f");
          stream.push("Q");
          stream.push("0 g");
          stream.push("q");
          stream.push("1 0 0 1 " + f5(AcroFormAppearance.internal.getWidth(formObject) / 2) + " " + f5(AcroFormAppearance.internal.getHeight(formObject) / 2) + " cm");
          stream.push(DotRadius + " 0 m");
          stream.push("" + DotRadius + " " + dc + " " + dc + " " + DotRadius + " 0 " + DotRadius + " c");
          stream.push("-" + dc + " " + DotRadius + " -" + DotRadius + " " + dc + " -" + DotRadius + " 0 c");
          stream.push("-" + DotRadius + " -" + dc + " -" + dc + " -" + DotRadius + " 0 -" + DotRadius + " c");
          stream.push(dc + " -" + DotRadius + " " + DotRadius + " -" + dc + " " + DotRadius + " 0 c");
          stream.push("f");
          stream.push("Q");
          xobj.stream = stream.join("\n");
          return xobj;
        },
        OffPushDown: function OffPushDown(formObject) {
          var xobj = new createFormXObject(formObject);
          var stream = [];
          var DotRadius = AcroFormAppearance.internal.getWidth(formObject) <= AcroFormAppearance.internal.getHeight(formObject) ? AcroFormAppearance.internal.getWidth(formObject) / 4 : AcroFormAppearance.internal.getHeight(formObject) / 4; // The Borderpadding...

          DotRadius = Number((DotRadius * 0.9).toFixed(5)); // Save results for later use; no need to waste
          // processor ticks on doing math

          var k = Number((DotRadius * 2).toFixed(5));
          var kc = Number((k * AcroFormAppearance.internal.Bezier_C).toFixed(5));
          stream.push("0.749023 g");
          stream.push("q");
          stream.push("1 0 0 1 " + f5(AcroFormAppearance.internal.getWidth(formObject) / 2) + " " + f5(AcroFormAppearance.internal.getHeight(formObject) / 2) + " cm");
          stream.push(k + " 0 m");
          stream.push(k + " " + kc + " " + kc + " " + k + " 0 " + k + " c");
          stream.push("-" + kc + " " + k + " -" + k + " " + kc + " -" + k + " 0 c");
          stream.push("-" + k + " -" + kc + " -" + kc + " -" + k + " 0 -" + k + " c");
          stream.push(kc + " -" + k + " " + k + " -" + kc + " " + k + " 0 c");
          stream.push("f");
          stream.push("Q");
          xobj.stream = stream.join("\n");
          return xobj;
        }
      },
      Cross: {
        /**
         * Creates the Actual AppearanceDictionary-References
         *
         * @param {string} name
         * @returns {Object}
         * @ignore
         */
        createAppearanceStream: function createAppearanceStream(name) {
          var appearanceStreamContent = {
            D: {
              Off: AcroFormAppearance.RadioButton.Cross.OffPushDown
            },
            N: {}
          };
          appearanceStreamContent.N[name] = AcroFormAppearance.RadioButton.Cross.YesNormal;
          appearanceStreamContent.D[name] = AcroFormAppearance.RadioButton.Cross.YesPushDown;
          return appearanceStreamContent;
        },
        getCA: function getCA() {
          return "8";
        },
        YesNormal: function YesNormal(formObject) {
          var xobj = new createFormXObject(formObject);
          var stream = [];
          var cross = AcroFormAppearance.internal.calculateCross(formObject);
          stream.push("q");
          stream.push("1 1 " + f2(AcroFormAppearance.internal.getWidth(formObject) - 2) + " " + f2(AcroFormAppearance.internal.getHeight(formObject) - 2) + " re");
          stream.push("W");
          stream.push("n");
          stream.push(f2(cross.x1.x) + " " + f2(cross.x1.y) + " m");
          stream.push(f2(cross.x2.x) + " " + f2(cross.x2.y) + " l");
          stream.push(f2(cross.x4.x) + " " + f2(cross.x4.y) + " m");
          stream.push(f2(cross.x3.x) + " " + f2(cross.x3.y) + " l");
          stream.push("s");
          stream.push("Q");
          xobj.stream = stream.join("\n");
          return xobj;
        },
        YesPushDown: function YesPushDown(formObject) {
          var xobj = new createFormXObject(formObject);
          var cross = AcroFormAppearance.internal.calculateCross(formObject);
          var stream = [];
          stream.push("0.749023 g");
          stream.push("0 0 " + f2(AcroFormAppearance.internal.getWidth(formObject)) + " " + f2(AcroFormAppearance.internal.getHeight(formObject)) + " re");
          stream.push("f");
          stream.push("q");
          stream.push("1 1 " + f2(AcroFormAppearance.internal.getWidth(formObject) - 2) + " " + f2(AcroFormAppearance.internal.getHeight(formObject) - 2) + " re");
          stream.push("W");
          stream.push("n");
          stream.push(f2(cross.x1.x) + " " + f2(cross.x1.y) + " m");
          stream.push(f2(cross.x2.x) + " " + f2(cross.x2.y) + " l");
          stream.push(f2(cross.x4.x) + " " + f2(cross.x4.y) + " m");
          stream.push(f2(cross.x3.x) + " " + f2(cross.x3.y) + " l");
          stream.push("s");
          stream.push("Q");
          xobj.stream = stream.join("\n");
          return xobj;
        },
        OffPushDown: function OffPushDown(formObject) {
          var xobj = new createFormXObject(formObject);
          var stream = [];
          stream.push("0.749023 g");
          stream.push("0 0 " + f2(AcroFormAppearance.internal.getWidth(formObject)) + " " + f2(AcroFormAppearance.internal.getHeight(formObject)) + " re");
          stream.push("f");
          xobj.stream = stream.join("\n");
          return xobj;
        }
      }
    },

    /**
     * Returns the standard Appearance
     *
     * @returns {AcroFormXObject}
     */
    createDefaultAppearanceStream: function createDefaultAppearanceStream(formObject) {
      // Set Helvetica to Standard Font (size: auto)
      // Color: Black
      var fontKey = scope.internal.getFont(formObject.fontName, formObject.fontStyle).id;

      var encodedColor = scope.__private__.encodeColorString(formObject.color);

      var fontSize = formObject.fontSize;
      var result = "/" + fontKey + " " + fontSize + " Tf " + encodedColor;
      return result;
    }
  };
  AcroFormAppearance.internal = {
    Bezier_C: 0.551915024494,
    calculateCross: function calculateCross(formObject) {
      var width = AcroFormAppearance.internal.getWidth(formObject);
      var height = AcroFormAppearance.internal.getHeight(formObject);
      var a = Math.min(width, height);
      var cross = {
        x1: {
          // upperLeft
          x: (width - a) / 2,
          y: (height - a) / 2 + a // height - borderPadding

        },
        x2: {
          // lowerRight
          x: (width - a) / 2 + a,
          y: (height - a) / 2 // borderPadding

        },
        x3: {
          // lowerLeft
          x: (width - a) / 2,
          y: (height - a) / 2 // borderPadding

        },
        x4: {
          // upperRight
          x: (width - a) / 2 + a,
          y: (height - a) / 2 + a // height - borderPadding

        }
      };
      return cross;
    }
  };

  AcroFormAppearance.internal.getWidth = function (formObject) {
    var result = 0;

    if (_typeof(formObject) === "object") {
      result = scale(formObject.Rect[2]);
    }

    return result;
  };

  AcroFormAppearance.internal.getHeight = function (formObject) {
    var result = 0;

    if (_typeof(formObject) === "object") {
      result = scale(formObject.Rect[3]);
    }

    return result;
  }; // Public:

  /**
   * Add an AcroForm-Field to the jsPDF-instance
   *
   * @name addField
   * @function
   * @instance
   * @param {Object} fieldObject
   * @returns {jsPDF}
   */


  var addField = jsPDFAPI.addField = function (fieldObject) {
    initializeAcroForm.call(this);

    if (fieldObject instanceof AcroFormField) {
      putForm.call(this, fieldObject);
    } else {
      throw new Error("Invalid argument passed to jsPDF.addField.");
    }

    fieldObject.page = scope.internal.getCurrentPageInfo().pageNumber;
    return this;
  };
  /**
   * @name addButton
   * @function
   * @instance
   * @param {AcroFormButton} options
   * @returns {jsPDF}
   * @deprecated
   */


  jsPDFAPI.addButton = function (button) {
    if (button instanceof AcroFormButton === false) {
      throw new Error("Invalid argument passed to jsPDF.addButton.");
    }

    return addField.call(this, button);
  };
  /**
   * @name addTextField
   * @function
   * @instance
   * @param {AcroFormTextField} textField
   * @returns {jsPDF}
   * @deprecated
   */


  jsPDFAPI.addTextField = function (textField) {
    if (textField instanceof AcroFormTextField === false) {
      throw new Error("Invalid argument passed to jsPDF.addTextField.");
    }

    return addField.call(this, textField);
  };
  /**
   * @name addChoiceField
   * @function
   * @instance
   * @param {AcroFormChoiceField}
   * @returns {jsPDF}
   * @deprecated
   */


  jsPDFAPI.addChoiceField = function (choiceField) {
    if (choiceField instanceof AcroFormChoiceField === false) {
      throw new Error("Invalid argument passed to jsPDF.addChoiceField.");
    }

    return addField.call(this, choiceField);
  };

  if (_typeof(globalObj) == "object" && typeof globalObj["ChoiceField"] === "undefined" && typeof globalObj["ListBox"] === "undefined" && typeof globalObj["ComboBox"] === "undefined" && typeof globalObj["EditBox"] === "undefined" && typeof globalObj["Button"] === "undefined" && typeof globalObj["PushButton"] === "undefined" && typeof globalObj["RadioButton"] === "undefined" && typeof globalObj["CheckBox"] === "undefined" && typeof globalObj["TextField"] === "undefined" && typeof globalObj["PasswordField"] === "undefined") {
    globalObj["ChoiceField"] = AcroFormChoiceField;
    globalObj["ListBox"] = AcroFormListBox;
    globalObj["ComboBox"] = AcroFormComboBox;
    globalObj["EditBox"] = AcroFormEditBox;
    globalObj["Button"] = AcroFormButton;
    globalObj["PushButton"] = AcroFormPushButton;
    globalObj["RadioButton"] = AcroFormRadioButton;
    globalObj["CheckBox"] = AcroFormCheckBox;
    globalObj["TextField"] = AcroFormTextField;
    globalObj["PasswordField"] = AcroFormPasswordField; // backwardsCompatibility

    globalObj["AcroForm"] = {
      Appearance: AcroFormAppearance
    };
  } else {
    // eslint-disable-next-line no-console
    console.warn("AcroForm-Classes are not populated into global-namespace, because the class-Names exist already. This avoids conflicts with the already used framework.");
  }

  jsPDFAPI.AcroFormChoiceField = AcroFormChoiceField;
  jsPDFAPI.AcroFormListBox = AcroFormListBox;
  jsPDFAPI.AcroFormComboBox = AcroFormComboBox;
  jsPDFAPI.AcroFormEditBox = AcroFormEditBox;
  jsPDFAPI.AcroFormButton = AcroFormButton;
  jsPDFAPI.AcroFormPushButton = AcroFormPushButton;
  jsPDFAPI.AcroFormRadioButton = AcroFormRadioButton;
  jsPDFAPI.AcroFormCheckBox = AcroFormCheckBox;
  jsPDFAPI.AcroFormTextField = AcroFormTextField;
  jsPDFAPI.AcroFormPasswordField = AcroFormPasswordField;
  jsPDFAPI.AcroFormAppearance = AcroFormAppearance;
  jsPDFAPI.AcroForm = {
    ChoiceField: AcroFormChoiceField,
    ListBox: AcroFormListBox,
    ComboBox: AcroFormComboBox,
    EditBox: AcroFormEditBox,
    Button: AcroFormButton,
    PushButton: AcroFormPushButton,
    RadioButton: AcroFormRadioButton,
    CheckBox: AcroFormCheckBox,
    TextField: AcroFormTextField,
    PasswordField: AcroFormPasswordField,
    Appearance: AcroFormAppearance
  };
  jsPDF.AcroForm = {
    ChoiceField: AcroFormChoiceField,
    ListBox: AcroFormListBox,
    ComboBox: AcroFormComboBox,
    EditBox: AcroFormEditBox,
    Button: AcroFormButton,
    PushButton: AcroFormPushButton,
    RadioButton: AcroFormRadioButton,
    CheckBox: AcroFormCheckBox,
    TextField: AcroFormTextField,
    PasswordField: AcroFormPasswordField,
    Appearance: AcroFormAppearance
  };
})(jsPDF, typeof window !== "undefined" && window || typeof global !== "undefined" && global);

/* global jsPDF */

/** @license
 * jsPDF addImage plugin
 * Copyright (c) 2012 Jason Siefken, https://github.com/siefkenj/
 *               2013 Chris Dowling, https://github.com/gingerchris
 *               2013 Trinh Ho, https://github.com/ineedfat
 *               2013 Edwin Alejandro Perez, https://github.com/eaparango
 *               2013 Norah Smith, https://github.com/burnburnrocket
 *               2014 Diego Casorran, https://github.com/diegocr
 *               2014 James Robb, https://github.com/jamesbrobb
 *
 * 
 */

/**
 * @name addImage
 * @module
 */
(function (jsPDFAPI) {

  var namespace = "addImage_";
  jsPDFAPI.__addimage__ = {};
  var UNKNOWN = "UNKNOWN";
  var imageFileTypeHeaders = {
    PNG: [[0x89, 0x50, 0x4e, 0x47]],
    TIFF: [[0x4d, 0x4d, 0x00, 0x2a], //Motorola
    [0x49, 0x49, 0x2a, 0x00] //Intel
    ],
    JPEG: [[0xff, 0xd8, 0xff, 0xe0, undefined, undefined, 0x4a, 0x46, 0x49, 0x46, 0x00], //JFIF
    [0xff, 0xd8, 0xff, 0xe1, undefined, undefined, 0x45, 0x78, 0x69, 0x66, 0x00, 0x00], //Exif
    [0xff, 0xd8, 0xff, 0xdb], //JPEG RAW
    [0xff, 0xd8, 0xff, 0xee] //EXIF RAW
    ],
    JPEG2000: [[0x00, 0x00, 0x00, 0x0c, 0x6a, 0x50, 0x20, 0x20]],
    GIF87a: [[0x47, 0x49, 0x46, 0x38, 0x37, 0x61]],
    GIF89a: [[0x47, 0x49, 0x46, 0x38, 0x39, 0x61]],
    WEBP: [[0x52, 0x49, 0x46, 0x46, undefined, undefined, undefined, undefined, 0x57, 0x45, 0x42, 0x50]],
    BMP: [[0x42, 0x4d], //BM - Windows 3.1x, 95, NT, ... etc.
    [0x42, 0x41], //BA - OS/2 struct bitmap array
    [0x43, 0x49], //CI - OS/2 struct color icon
    [0x43, 0x50], //CP - OS/2 const color pointer
    [0x49, 0x43], //IC - OS/2 struct icon
    [0x50, 0x54] //PT - OS/2 pointer
    ]
  };
  /**
   * Recognize filetype of Image by magic-bytes
   *
   * https://en.wikipedia.org/wiki/List_of_file_signatures
   *
   * @name getImageFileTypeByImageData
   * @public
   * @function
   * @param {string|arraybuffer} imageData imageData as binary String or arraybuffer
   * @param {string} format format of file if filetype-recognition fails, e.g. 'JPEG'
   *
   * @returns {string} filetype of Image
   */

  var getImageFileTypeByImageData = jsPDFAPI.__addimage__.getImageFileTypeByImageData = function (imageData, fallbackFormat) {
    fallbackFormat = fallbackFormat || UNKNOWN;
    var i;
    var j;
    var result = UNKNOWN;
    var headerSchemata;
    var compareResult;
    var fileType;

    if (isArrayBufferView(imageData)) {
      for (fileType in imageFileTypeHeaders) {
        headerSchemata = imageFileTypeHeaders[fileType];

        for (i = 0; i < headerSchemata.length; i += 1) {
          compareResult = true;

          for (j = 0; j < headerSchemata[i].length; j += 1) {
            if (headerSchemata[i][j] === undefined) {
              continue;
            }

            if (headerSchemata[i][j] !== imageData[j]) {
              compareResult = false;
              break;
            }
          }

          if (compareResult === true) {
            result = fileType;
            break;
          }
        }
      }
    } else {
      for (fileType in imageFileTypeHeaders) {
        headerSchemata = imageFileTypeHeaders[fileType];

        for (i = 0; i < headerSchemata.length; i += 1) {
          compareResult = true;

          for (j = 0; j < headerSchemata[i].length; j += 1) {
            if (headerSchemata[i][j] === undefined) {
              continue;
            }

            if (headerSchemata[i][j] !== imageData.charCodeAt(j)) {
              compareResult = false;
              break;
            }
          }

          if (compareResult === true) {
            result = fileType;
            break;
          }
        }
      }
    }

    if (result === UNKNOWN && fallbackFormat !== UNKNOWN) {
      result = fallbackFormat;
    }

    return result;
  }; // Image functionality ported from pdf.js


  var putImage = function putImage(image) {
    var out = this.internal.write;
    var putStream = this.internal.putStream;
    var getFilters = this.internal.getFilters;
    var filter = getFilters();

    while (filter.indexOf("FlateEncode") !== -1) {
      filter.splice(filter.indexOf("FlateEncode"), 1);
    }

    image.objectId = this.internal.newObject();
    var additionalKeyValues = [];
    additionalKeyValues.push({
      key: "Type",
      value: "/XObject"
    });
    additionalKeyValues.push({
      key: "Subtype",
      value: "/Image"
    });
    additionalKeyValues.push({
      key: "Width",
      value: image.width
    });
    additionalKeyValues.push({
      key: "Height",
      value: image.height
    });

    if (image.colorSpace === color_spaces.INDEXED) {
      additionalKeyValues.push({
        key: "ColorSpace",
        value: "[/Indexed /DeviceRGB " + ( // if an indexed png defines more than one colour with transparency, we've created a sMask
        image.palette.length / 3 - 1) + " " + ("sMask" in image && typeof image.sMask !== "undefined" ? image.objectId + 2 : image.objectId + 1) + " 0 R]"
      });
    } else {
      additionalKeyValues.push({
        key: "ColorSpace",
        value: "/" + image.colorSpace
      });

      if (image.colorSpace === color_spaces.DEVICE_CMYK) {
        additionalKeyValues.push({
          key: "Decode",
          value: "[1 0 1 0 1 0 1 0]"
        });
      }
    }

    additionalKeyValues.push({
      key: "BitsPerComponent",
      value: image.bitsPerComponent
    });

    if ("decodeParameters" in image && typeof image.decodeParameters !== "undefined") {
      additionalKeyValues.push({
        key: "DecodeParms",
        value: "<<" + image.decodeParameters + ">>"
      });
    }

    if ("transparency" in image && Array.isArray(image.transparency)) {
      var transparency = "",
          i = 0,
          len = image.transparency.length;

      for (; i < len; i++) {
        transparency += image.transparency[i] + " " + image.transparency[i] + " ";
      }

      additionalKeyValues.push({
        key: "Mask",
        value: "[" + transparency + "]"
      });
    }

    if (typeof image.sMask !== "undefined") {
      additionalKeyValues.push({
        key: "SMask",
        value: image.objectId + 1 + " 0 R"
      });
    }

    var alreadyAppliedFilters = typeof image.filter !== "undefined" ? ["/" + image.filter] : undefined;
    putStream({
      data: image.data,
      additionalKeyValues: additionalKeyValues,
      alreadyAppliedFilters: alreadyAppliedFilters
    });
    out("endobj"); // Soft mask

    if ("sMask" in image && typeof image.sMask !== "undefined") {
      var decodeParameters = "/Predictor " + image.predictor + " /Colors 1 /BitsPerComponent " + image.bitsPerComponent + " /Columns " + image.width;
      var sMask = {
        width: image.width,
        height: image.height,
        colorSpace: "DeviceGray",
        bitsPerComponent: image.bitsPerComponent,
        decodeParameters: decodeParameters,
        data: image.sMask
      };

      if ("filter" in image) {
        sMask.filter = image.filter;
      }

      putImage.call(this, sMask);
    } //Palette


    if (image.colorSpace === color_spaces.INDEXED) {
      this.internal.newObject(); //out('<< /Filter / ' + img['f'] +' /Length ' + img['pal'].length + '>>');
      //putStream(zlib.compress(img['pal']));

      putStream({
        data: arrayBufferToBinaryString(new Uint8Array(image.palette))
      });
      out("endobj");
    }
  };

  var putResourcesCallback = function putResourcesCallback() {
    var images = this.internal.collections[namespace + "images"];

    for (var i in images) {
      putImage.call(this, images[i]);
    }
  };

  var putXObjectsDictCallback = function putXObjectsDictCallback() {
    var images = this.internal.collections[namespace + "images"],
        out = this.internal.write,
        image;

    for (var i in images) {
      image = images[i];
      out("/I" + image.index, image.objectId, "0", "R");
    }
  };

  var checkCompressValue = function checkCompressValue(value) {
    if (value && typeof value === "string") { value = value.toUpperCase(); }
    return value in jsPDFAPI.image_compression ? value : image_compression.NONE;
  };

  var initialize = function initialize() {
    if (!this.internal.collections[namespace + "images"]) {
      this.internal.collections[namespace + "images"] = {};
      this.internal.events.subscribe("putResources", putResourcesCallback);
      this.internal.events.subscribe("putXobjectDict", putXObjectsDictCallback);
    }
  };

  var getImages = function getImages() {
    var images = this.internal.collections[namespace + "images"];
    initialize.call(this);
    return images;
  };

  var getImageIndex = function getImageIndex() {
    return Object.keys(this.internal.collections[namespace + "images"]).length;
  };

  var notDefined = function notDefined(value) {
    return typeof value === "undefined" || value === null || value.length === 0;
  };

  var generateAliasFromImageData = function generateAliasFromImageData(imageData) {
    if (typeof imageData === "string" || isArrayBufferView(imageData)) {
      return sHashCode(imageData);
    }

    return null;
  };

  var isImageTypeSupported = function isImageTypeSupported(type) {
    return typeof jsPDFAPI["process" + type.toUpperCase()] === "function";
  };

  var isDOMElement = function isDOMElement(object) {
    return _typeof(object) === "object" && object.nodeType === 1;
  };

  var getImageDataFromElement = function getImageDataFromElement(element, format) {
    //if element is an image which uses data url definition, just return the dataurl
    if (element.nodeName === "IMG" && element.hasAttribute("src")) {
      var src = "" + element.getAttribute("src"); //is base64 encoded dataUrl, directly process it

      if (src.indexOf("data:image/") === 0) {
        return atob(unescape(src).split("base64,").pop());
      } //it is probably an url, try to load it


      var tmpImageData = jsPDFAPI.loadFile(src, true);

      if (tmpImageData !== undefined) {
        return tmpImageData;
      }
    }

    if (element.nodeName === "CANVAS") {
      var mimeType;

      switch (format) {
        case "PNG":
          mimeType = "image/png";
          break;

        case "WEBP":
          mimeType = "image/webp";
          break;

        case "JPEG":
        case "JPG":
        default:
          mimeType = "image/jpeg";
          break;
      }

      return atob(element.toDataURL(mimeType, 1.0).split("base64,").pop());
    }
  };

  var checkImagesForAlias = function checkImagesForAlias(alias) {
    var images = this.internal.collections[namespace + "images"];

    if (images) {
      for (var e in images) {
        if (alias === images[e].alias) {
          return images[e];
        }
      }
    }
  };

  var determineWidthAndHeight = function determineWidthAndHeight(width, height, image) {
    if (!width && !height) {
      width = -96;
      height = -96;
    }

    if (width < 0) {
      width = -1 * image.width * 72 / width / this.internal.scaleFactor;
    }

    if (height < 0) {
      height = -1 * image.height * 72 / height / this.internal.scaleFactor;
    }

    if (width === 0) {
      width = height * image.width / image.height;
    }

    if (height === 0) {
      height = width * image.height / image.width;
    }

    return [width, height];
  };

  var writeImageToPDF = function writeImageToPDF(x, y, width, height, image, rotation) {
    var dims = determineWidthAndHeight.call(this, width, height, image),
        coord = this.internal.getCoordinateString,
        vcoord = this.internal.getVerticalCoordinateString;
    var images = getImages.call(this);
    width = dims[0];
    height = dims[1];
    images[image.index] = image;

    if (rotation) {
      rotation *= Math.PI / 180;
      var c = Math.cos(rotation);
      var s = Math.sin(rotation); //like in pdf Reference do it 4 digits instead of 2

      var f4 = function f4(number) {
        return number.toFixed(4);
      };

      var rotationTransformationMatrix = [f4(c), f4(s), f4(s * -1), f4(c), 0, 0, "cm"];
    }

    this.internal.write("q"); //Save graphics state

    if (rotation) {
      this.internal.write([1, "0", "0", 1, coord(x), vcoord(y + height), "cm"].join(" ")); //Translate

      this.internal.write(rotationTransformationMatrix.join(" ")); //Rotate

      this.internal.write([coord(width), "0", "0", coord(height), "0", "0", "cm"].join(" ")); //Scale
    } else {
      this.internal.write([coord(width), "0", "0", coord(height), coord(x), vcoord(y + height), "cm"].join(" ")); //Translate and Scale
    }

    if (this.isAdvancedAPI()) {
      // draw image bottom up when in "advanced" API mode
      this.internal.write([1, 0, 0, -1, 0, 0, "cm"].join(" "));
    }

    this.internal.write("/I" + image.index + " Do"); //Paint Image

    this.internal.write("Q"); //Restore graphics state
  };
  /**
   * COLOR SPACES
   */


  var color_spaces = jsPDFAPI.color_spaces = {
    DEVICE_RGB: "DeviceRGB",
    DEVICE_GRAY: "DeviceGray",
    DEVICE_CMYK: "DeviceCMYK",
    CAL_GREY: "CalGray",
    CAL_RGB: "CalRGB",
    LAB: "Lab",
    ICC_BASED: "ICCBased",
    INDEXED: "Indexed",
    PATTERN: "Pattern",
    SEPARATION: "Separation",
    DEVICE_N: "DeviceN"
  };
  /**
   * DECODE METHODS
   */

  jsPDFAPI.decode = {
    DCT_DECODE: "DCTDecode",
    FLATE_DECODE: "FlateDecode",
    LZW_DECODE: "LZWDecode",
    JPX_DECODE: "JPXDecode",
    JBIG2_DECODE: "JBIG2Decode",
    ASCII85_DECODE: "ASCII85Decode",
    ASCII_HEX_DECODE: "ASCIIHexDecode",
    RUN_LENGTH_DECODE: "RunLengthDecode",
    CCITT_FAX_DECODE: "CCITTFaxDecode"
  };
  /**
   * IMAGE COMPRESSION TYPES
   */

  var image_compression = jsPDFAPI.image_compression = {
    NONE: "NONE",
    FAST: "FAST",
    MEDIUM: "MEDIUM",
    SLOW: "SLOW"
  };
  /**
   * @name sHashCode
   * @function
   * @param {string} data
   * @returns {string}
   */

  var sHashCode = jsPDFAPI.__addimage__.sHashCode = function (data) {
    var hash = 0,
        i,
        len;

    if (typeof data === "string") {
      len = data.length;

      for (i = 0; i < len; i++) {
        hash = (hash << 5) - hash + data.charCodeAt(i);
        hash |= 0; // Convert to 32bit integer
      }
    } else if (isArrayBufferView(data)) {
      len = data.byteLength / 2;

      for (i = 0; i < len; i++) {
        hash = (hash << 5) - hash + data[i];
        hash |= 0; // Convert to 32bit integer
      }
    }

    return hash;
  };
  /**
   * Validates if given String is a valid Base64-String
   *
   * @name validateStringAsBase64
   * @public
   * @function
   * @param {String} possible Base64-String
   *
   * @returns {boolean}
   */


  var validateStringAsBase64 = jsPDFAPI.__addimage__.validateStringAsBase64 = function (possibleBase64String) {
    possibleBase64String = possibleBase64String || "";
    possibleBase64String.toString().trim();
    var result = true;

    if (possibleBase64String.length === 0) {
      result = false;
    }

    if (possibleBase64String.length % 4 !== 0) {
      result = false;
    }

    if (/^[A-Za-z0-9+/]+$/.test(possibleBase64String.substr(0, possibleBase64String.length - 2)) === false) {
      result = false;
    }

    if (/^[A-Za-z0-9/][A-Za-z0-9+/]|[A-Za-z0-9+/]=|==$/.test(possibleBase64String.substr(-2)) === false) {
      result = false;
    }

    return result;
  };
  /**
   * Strips out and returns info from a valid base64 data URI
   *
   * @name extractImageFromDataUrl
   * @function
   * @param {string} dataUrl a valid data URI of format 'data:[<MIME-type>][;base64],<data>'
   * @returns {Array}an Array containing the following
   * [0] the complete data URI
   * [1] <MIME-type>
   * [2] format - the second part of the mime-type i.e 'png' in 'image/png'
   * [4] <data>
   */


  var extractImageFromDataUrl = jsPDFAPI.__addimage__.extractImageFromDataUrl = function (dataUrl) {
    dataUrl = dataUrl || "";
    var dataUrlParts = dataUrl.split("base64,");
    var result = null;

    if (dataUrlParts.length === 2) {
      var extractedInfo = /^data:(\w*\/\w*);*(charset=[\w=-]*)*;*$/.exec(dataUrlParts[0]);

      if (Array.isArray(extractedInfo)) {
        result = {
          mimeType: extractedInfo[1],
          charset: extractedInfo[2],
          data: dataUrlParts[1]
        };
      }
    }

    return result;
  };
  /**
   * Check to see if ArrayBuffer is supported
   *
   * @name supportsArrayBuffer
   * @function
   * @returns {boolean}
   */


  var supportsArrayBuffer = jsPDFAPI.__addimage__.supportsArrayBuffer = function () {
    return typeof ArrayBuffer !== "undefined" && typeof Uint8Array !== "undefined";
  };
  /**
   * Tests supplied object to determine if ArrayBuffer
   *
   * @name isArrayBuffer
   * @function
   * @param {Object} object an Object
   *
   * @returns {boolean}
   */


  jsPDFAPI.__addimage__.isArrayBuffer = function (object) {
    return supportsArrayBuffer() && object instanceof ArrayBuffer;
  };
  /**
   * Tests supplied object to determine if it implements the ArrayBufferView (TypedArray) interface
   *
   * @name isArrayBufferView
   * @function
   * @param {Object} object an Object
   * @returns {boolean}
   */


  var isArrayBufferView = jsPDFAPI.__addimage__.isArrayBufferView = function (object) {
    return supportsArrayBuffer() && typeof Uint32Array !== "undefined" && (object instanceof Int8Array || object instanceof Uint8Array || typeof Uint8ClampedArray !== "undefined" && object instanceof Uint8ClampedArray || object instanceof Int16Array || object instanceof Uint16Array || object instanceof Int32Array || object instanceof Uint32Array || object instanceof Float32Array || object instanceof Float64Array);
  };
  /**
   * Convert Binary String to ArrayBuffer
   *
   * @name binaryStringToUint8Array
   * @public
   * @function
   * @param {string} BinaryString with ImageData
   * @returns {Uint8Array}
   */


  var binaryStringToUint8Array = jsPDFAPI.__addimage__.binaryStringToUint8Array = function (binary_string) {
    var len = binary_string.length;
    var bytes = new Uint8Array(len);

    for (var i = 0; i < len; i++) {
      bytes[i] = binary_string.charCodeAt(i);
    }

    return bytes;
  };
  /**
   * Convert the Buffer to a Binary String
   *
   * @name arrayBufferToBinaryString
   * @public
   * @function
   * @param {ArrayBuffer} ArrayBuffer with ImageData
   *
   * @returns {String}
   */


  var arrayBufferToBinaryString = jsPDFAPI.__addimage__.arrayBufferToBinaryString = function (buffer) {
    try {
      return atob(btoa(String.fromCharCode.apply(null, buffer)));
    } catch (e) {
      if (typeof Uint8Array !== "undefined" && typeof Uint8Array.prototype.reduce !== "undefined") {
        return new Uint8Array(buffer).reduce(function (data, _byte) {
          return data.push(String.fromCharCode(_byte)), data;
        }, []).join("");
      }
    }
  };
  /**
   * Adds an Image to the PDF.
   *
   * @name addImage
   * @public
   * @function
   * @param {string|HTMLImageElement|HTMLCanvasElement|Uint8Array} imageData imageData as base64 encoded DataUrl or Image-HTMLElement or Canvas-HTMLElement
   * @param {string} format format of file if filetype-recognition fails or in case of a Canvas-Element needs to be specified (default for Canvas is JPEG), e.g. 'JPEG', 'PNG', 'WEBP'
   * @param {number} x x Coordinate (in units declared at inception of PDF document) against left edge of the page
   * @param {number} y y Coordinate (in units declared at inception of PDF document) against upper edge of the page
   * @param {number} width width of the image (in units declared at inception of PDF document)
   * @param {number} height height of the Image (in units declared at inception of PDF document)
   * @param {string} alias alias of the image (if used multiple times)
   * @param {string} compression compression of the generated JPEG, can have the values 'NONE', 'FAST', 'MEDIUM' and 'SLOW'
   * @param {number} rotation rotation of the image in degrees (0-359)
   *
   * @returns jsPDF
   */


  jsPDFAPI.addImage = function () {
    var imageData, format, x, y, w, h, alias, compression, rotation;
    imageData = arguments[0];

    if (typeof arguments[1] === "number") {
      format = UNKNOWN;
      x = arguments[1];
      y = arguments[2];
      w = arguments[3];
      h = arguments[4];
      alias = arguments[5];
      compression = arguments[6];
      rotation = arguments[7];
    } else {
      format = arguments[1];
      x = arguments[2];
      y = arguments[3];
      w = arguments[4];
      h = arguments[5];
      alias = arguments[6];
      compression = arguments[7];
      rotation = arguments[8];
    }

    if (_typeof(imageData) === "object" && !isDOMElement(imageData) && "imageData" in imageData) {
      var options = imageData;
      imageData = options.imageData;
      format = options.format || format || UNKNOWN;
      x = options.x || x || 0;
      y = options.y || y || 0;
      w = options.w || options.width || w;
      h = options.h || options.height || h;
      alias = options.alias || alias;
      compression = options.compression || compression;
      rotation = options.rotation || options.angle || rotation;
    } //If compression is not explicitly set, determine if we should use compression


    var filter = this.internal.getFilters();

    if (compression === undefined && filter.indexOf("FlateEncode") !== -1) {
      compression = "SLOW";
    }

    if (isNaN(x) || isNaN(y)) {
      throw new Error("Invalid coordinates passed to jsPDF.addImage");
    }

    initialize.call(this);
    var image = processImageData.call(this, imageData, format, alias, compression);
    writeImageToPDF.call(this, x, y, w, h, image, rotation);
    return this;
  };

  var processImageData = function processImageData(imageData, format, alias, compression) {
    var result, dataAsBinaryString;

    if (typeof imageData === "string" && getImageFileTypeByImageData(imageData) === UNKNOWN) {
      imageData = unescape(imageData);
      var tmpImageData = convertBase64ToBinaryString(imageData, false);

      if (tmpImageData !== "") {
        imageData = tmpImageData;
      } else {
        tmpImageData = jsPDFAPI.loadFile(imageData, true);

        if (tmpImageData !== undefined) {
          imageData = tmpImageData;
        }
      }
    }

    if (isDOMElement(imageData)) {
      imageData = getImageDataFromElement(imageData, format);
    }

    format = getImageFileTypeByImageData(imageData, format);

    if (!isImageTypeSupported(format)) {
      throw new Error("addImage does not support files of type '" + format + "', please ensure that a plugin for '" + format + "' support is added.");
    } // now do the heavy lifting


    if (notDefined(alias)) {
      alias = generateAliasFromImageData(imageData);
    }

    result = checkImagesForAlias.call(this, alias);

    if (!result) {
      if (supportsArrayBuffer()) {
        // no need to convert if imageData is already uint8array
        if (!(imageData instanceof Uint8Array)) {
          dataAsBinaryString = imageData;
          imageData = binaryStringToUint8Array(imageData);
        }
      }

      result = this["process" + format.toUpperCase()](imageData, getImageIndex.call(this), alias, checkCompressValue(compression), dataAsBinaryString);
    }

    if (!result) {
      throw new Error("An unknown error occurred whilst processing the image.");
    }

    return result;
  };
  /**
   * @name convertBase64ToBinaryString
   * @function
   * @param {string} stringData
   * @returns {string} binary string
   */


  var convertBase64ToBinaryString = jsPDFAPI.__addimage__.convertBase64ToBinaryString = function (stringData, throwError) {
    throwError = typeof throwError === "boolean" ? throwError : true;
    var base64Info;
    var imageData = "";
    var rawData;

    if (typeof stringData === "string") {
      base64Info = extractImageFromDataUrl(stringData);
      rawData = base64Info !== null ? base64Info.data : stringData;

      try {
        imageData = atob(rawData);
      } catch (e) {
        if (throwError) {
          if (!validateStringAsBase64(rawData)) {
            throw new Error("Supplied Data is not a valid base64-String jsPDF.convertBase64ToBinaryString ");
          } else {
            throw new Error("atob-Error in jsPDF.convertBase64ToBinaryString " + e.message);
          }
        }
      }
    }

    return imageData;
  };
  /**
   * @name getImageProperties
   * @function
   * @param {Object} imageData
   * @returns {Object}
   */


  jsPDFAPI.getImageProperties = function (imageData) {
    var image;
    var tmpImageData = "";
    var format;

    if (isDOMElement(imageData)) {
      imageData = getImageDataFromElement(imageData);
    }

    if (typeof imageData === "string" && getImageFileTypeByImageData(imageData) === UNKNOWN) {
      tmpImageData = convertBase64ToBinaryString(imageData, false);

      if (tmpImageData === "") {
        tmpImageData = jsPDFAPI.loadFile(imageData) || "";
      }

      imageData = tmpImageData;
    }

    format = getImageFileTypeByImageData(imageData);

    if (!isImageTypeSupported(format)) {
      throw new Error("addImage does not support files of type '" + format + "', please ensure that a plugin for '" + format + "' support is added.");
    }

    if (supportsArrayBuffer() && !(imageData instanceof Uint8Array)) {
      imageData = binaryStringToUint8Array(imageData);
    }

    image = this["process" + format.toUpperCase()](imageData);

    if (!image) {
      throw new Error("An unknown error occurred whilst processing the image");
    }

    image.fileType = format;
    return image;
  };
})(jsPDF.API);

/* global jsPDF */

/**
 * @license
 * Copyright (c) 2014 Steven Spungin (TwelveTone LLC)  steven@twelvetone.tv
 *
 * Licensed under the MIT License.
 * https://opensource.org/licenses/mit-license
 */

/**
 * jsPDF Annotations PlugIn
 *
 * There are many types of annotations in a PDF document. Annotations are placed
 * on a page at a particular location. They are not 'attached' to an object.
 * <br />
 * This plugin current supports <br />
 * <li> Goto Page (set pageNumber and top in options)
 * <li> Goto Name (set name and top in options)
 * <li> Goto URL (set url in options)
 * <p>
 * 	The destination magnification factor can also be specified when goto is a page number or a named destination. (see documentation below)
 *  (set magFactor in options).  XYZ is the default.
 * </p>
 * <p>
 *  Links, Text, Popup, and FreeText are supported.
 * </p>
 * <p>
 * Options In PDF spec Not Implemented Yet
 * <li> link border
 * <li> named target
 * <li> page coordinates
 * <li> destination page scaling and layout
 * <li> actions other than URL and GotoPage
 * <li> background / hover actions
 * </p>
 * @name annotations
 * @module
 */

/*
    Destination Magnification Factors
    See PDF 1.3 Page 386 for meanings and options

    [supported]
	XYZ (options; left top zoom)
	Fit (no options)
	FitH (options: top)
	FitV (options: left)

	[not supported]
	FitR
	FitB
	FitBH
	FitBV
 */
(function (jsPDFAPI) {

  var notEmpty = function notEmpty(obj) {
    if (typeof obj != "undefined") {
      if (obj != "") {
        return true;
      }
    }
  };

  jsPDF.API.events.push(["addPage", function (addPageData) {
    var pageInfo = this.internal.getPageInfo(addPageData.pageNumber);
    pageInfo.pageContext.annotations = [];
  }]);
  jsPDFAPI.events.push(["putPage", function (putPageData) {
    var getHorizontalCoordinateString = this.internal.getCoordinateString;
    var getVerticalCoordinateString = this.internal.getVerticalCoordinateString;
    var pageInfo = this.internal.getPageInfoByObjId(putPageData.objId);
    var pageAnnos = putPageData.pageContext.annotations;
    var anno, rect, line;
    var found = false;

    for (var a = 0; a < pageAnnos.length && !found; a++) {
      anno = pageAnnos[a];

      switch (anno.type) {
        case "link":
          if (notEmpty(anno.options.url) || notEmpty(anno.options.pageNumber)) {
            found = true;
          }

          break;

        case "reference":
        case "text":
        case "freetext":
          found = true;
          break;
      }
    }

    if (found == false) {
      return;
    }

    this.internal.write("/Annots [");

    for (var i = 0; i < pageAnnos.length; i++) {
      anno = pageAnnos[i];

      switch (anno.type) {
        case "reference":
          // References to Widget Annotations (for AcroForm Fields)
          this.internal.write(" " + anno.object.objId + " 0 R ");
          break;

        case "text":
          // Create a an object for both the text and the popup
          var objText = this.internal.newAdditionalObject();
          var objPopup = this.internal.newAdditionalObject();
          var title = anno.title || "Note";
          rect = "/Rect [" + getHorizontalCoordinateString(anno.bounds.x) + " " + getVerticalCoordinateString(anno.bounds.y + anno.bounds.h) + " " + getHorizontalCoordinateString(anno.bounds.x + anno.bounds.w) + " " + getVerticalCoordinateString(anno.bounds.y) + "] ";
          line = "<</Type /Annot /Subtype /" + "Text" + " " + rect + "/Contents (" + anno.contents + ")";
          line += " /Popup " + objPopup.objId + " 0 R";
          line += " /P " + pageInfo.objId + " 0 R";
          line += " /T (" + title + ") >>";
          objText.content = line;
          var parent = objText.objId + " 0 R";
          var popoff = 30;
          rect = "/Rect [" + getHorizontalCoordinateString(anno.bounds.x + popoff) + " " + getVerticalCoordinateString(anno.bounds.y + anno.bounds.h) + " " + getHorizontalCoordinateString(anno.bounds.x + anno.bounds.w + popoff) + " " + getVerticalCoordinateString(anno.bounds.y) + "] ";
          line = "<</Type /Annot /Subtype /" + "Popup" + " " + rect + " /Parent " + parent;

          if (anno.open) {
            line += " /Open true";
          }

          line += " >>";
          objPopup.content = line;
          this.internal.write(objText.objId, "0 R", objPopup.objId, "0 R");
          break;

        case "freetext":
          rect = "/Rect [" + getHorizontalCoordinateString(anno.bounds.x) + " " + getVerticalCoordinateString(anno.bounds.y) + " " + getHorizontalCoordinateString(anno.bounds.x + anno.bounds.w) + " " + getVerticalCoordinateString(anno.bounds.y + anno.bounds.h) + "] ";
          var color = anno.color || "#000000";
          line = "<</Type /Annot /Subtype /" + "FreeText" + " " + rect + "/Contents (" + anno.contents + ")";
          line += " /DS(font: Helvetica,sans-serif 12.0pt; text-align:left; color:#" + color + ")";
          line += " /Border [0 0 0]";
          line += " >>";
          this.internal.write(line);
          break;

        case "link":
          if (anno.options.name) {
            var loc = this.annotations._nameMap[anno.options.name];
            anno.options.pageNumber = loc.page;
            anno.options.top = loc.y;
          } else {
            if (!anno.options.top) {
              anno.options.top = 0;
            }
          }

          rect = "/Rect [" + getHorizontalCoordinateString(anno.x) + " " + getVerticalCoordinateString(anno.y) + " " + getHorizontalCoordinateString(anno.x + anno.w) + " " + getVerticalCoordinateString(anno.y + anno.h) + "] ";
          line = "";

          if (anno.options.url) {
            line = "<</Type /Annot /Subtype /Link " + rect + "/Border [0 0 0] /A <</S /URI /URI (" + anno.options.url + ") >>";
          } else if (anno.options.pageNumber) {
            // first page is 0
            var info = this.internal.getPageInfo(anno.options.pageNumber);
            line = "<</Type /Annot /Subtype /Link " + rect + "/Border [0 0 0] /Dest [" + info.objId + " 0 R";
            anno.options.magFactor = anno.options.magFactor || "XYZ";

            switch (anno.options.magFactor) {
              case "Fit":
                line += " /Fit]";
                break;

              case "FitH":
                line += " /FitH " + anno.options.top + "]";
                break;

              case "FitV":
                anno.options.left = anno.options.left || 0;
                line += " /FitV " + anno.options.left + "]";
                break;

              case "XYZ":
              default:
                var top = getVerticalCoordinateString(anno.options.top);
                anno.options.left = anno.options.left || 0; // 0 or null zoom will not change zoom factor

                if (typeof anno.options.zoom === "undefined") {
                  anno.options.zoom = 0;
                }

                line += " /XYZ " + anno.options.left + " " + top + " " + anno.options.zoom + "]";
                break;
            }
          }

          if (line != "") {
            line += " >>";
            this.internal.write(line);
          }

          break;
      }
    }

    this.internal.write("]");
  }]);
  /**
   * @name createAnnotation
   * @function
   * @param {Object} options
   */

  jsPDFAPI.createAnnotation = function (options) {
    var pageInfo = this.internal.getCurrentPageInfo();

    switch (options.type) {
      case "link":
        this.link(options.bounds.x, options.bounds.y, options.bounds.w, options.bounds.h, options);
        break;

      case "text":
      case "freetext":
        pageInfo.pageContext.annotations.push(options);
        break;
    }
  };
  /**
   * Create a link
   *
   * valid options
   * <li> pageNumber or url [required]
   * <p>If pageNumber is specified, top and zoom may also be specified</p>
   * @name link
   * @function
   * @param {number} x
   * @param {number} y
   * @param {number} w
   * @param {number} h
   * @param {Object} options
   */


  jsPDFAPI.link = function (x, y, w, h, options) {
    var pageInfo = this.internal.getCurrentPageInfo();
    pageInfo.pageContext.annotations.push({
      x: x,
      y: y,
      w: w,
      h: h,
      options: options,
      type: "link"
    });
  };
  /**
   * Currently only supports single line text.
   * Returns the width of the text/link
   *
   * @name textWithLink
   * @function
   * @param {string} text
   * @param {number} x
   * @param {number} y
   * @param {Object} options
   * @returns {number} width the width of the text/link
   */


  jsPDFAPI.textWithLink = function (text, x, y, options) {
    var width = this.getTextWidth(text);
    var height = this.internal.getLineHeight() / this.internal.scaleFactor;
    this.text(text, x, y, options); //TODO We really need the text baseline height to do this correctly.
    // Or ability to draw text on top, bottom, center, or baseline.

    y += height * 0.2;
    this.link(x, y - height, width, height, options);
    return width;
  }; //TODO move into external library

  /**
   * @name getTextWidth
   * @function
   * @param {string} text
   * @returns {number} txtWidth
   */


  jsPDFAPI.getTextWidth = function (text) {
    var fontSize = this.internal.getFontSize();
    var txtWidth = this.getStringUnitWidth(text) * fontSize / this.internal.scaleFactor;
    return txtWidth;
  };

  return this;
})(jsPDF.API);

/* global jsPDF */

/**
 * @license
 * Copyright (c) 2017 Aras Abbasi
 *
 * Licensed under the MIT License.
 * https://opensource.org/licenses/mit-license
 */

/**
 * jsPDF arabic parser PlugIn
 *
 * @name arabic
 * @module
 */
(function (jsPDFAPI) {
  /**
   * Arabic shape substitutions: char code => (isolated, final, initial, medial).
   * Arabic Substition A
   */

  var arabicSubstitionA = {
    0x0621: [0xfe80],
    // ARABIC LETTER HAMZA
    0x0622: [0xfe81, 0xfe82],
    // ARABIC LETTER ALEF WITH MADDA ABOVE
    0x0623: [0xfe83, 0xfe84],
    // ARABIC LETTER ALEF WITH HAMZA ABOVE
    0x0624: [0xfe85, 0xfe86],
    // ARABIC LETTER WAW WITH HAMZA ABOVE
    0x0625: [0xfe87, 0xfe88],
    // ARABIC LETTER ALEF WITH HAMZA BELOW
    0x0626: [0xfe89, 0xfe8a, 0xfe8b, 0xfe8c],
    // ARABIC LETTER YEH WITH HAMZA ABOVE
    0x0627: [0xfe8d, 0xfe8e],
    // ARABIC LETTER ALEF
    0x0628: [0xfe8f, 0xfe90, 0xfe91, 0xfe92],
    // ARABIC LETTER BEH
    0x0629: [0xfe93, 0xfe94],
    // ARABIC LETTER TEH MARBUTA
    0x062a: [0xfe95, 0xfe96, 0xfe97, 0xfe98],
    // ARABIC LETTER TEH
    0x062b: [0xfe99, 0xfe9a, 0xfe9b, 0xfe9c],
    // ARABIC LETTER THEH
    0x062c: [0xfe9d, 0xfe9e, 0xfe9f, 0xfea0],
    // ARABIC LETTER JEEM
    0x062d: [0xfea1, 0xfea2, 0xfea3, 0xfea4],
    // ARABIC LETTER HAH
    0x062e: [0xfea5, 0xfea6, 0xfea7, 0xfea8],
    // ARABIC LETTER KHAH
    0x062f: [0xfea9, 0xfeaa],
    // ARABIC LETTER DAL
    0x0630: [0xfeab, 0xfeac],
    // ARABIC LETTER THAL
    0x0631: [0xfead, 0xfeae],
    // ARABIC LETTER REH
    0x0632: [0xfeaf, 0xfeb0],
    // ARABIC LETTER ZAIN
    0x0633: [0xfeb1, 0xfeb2, 0xfeb3, 0xfeb4],
    // ARABIC LETTER SEEN
    0x0634: [0xfeb5, 0xfeb6, 0xfeb7, 0xfeb8],
    // ARABIC LETTER SHEEN
    0x0635: [0xfeb9, 0xfeba, 0xfebb, 0xfebc],
    // ARABIC LETTER SAD
    0x0636: [0xfebd, 0xfebe, 0xfebf, 0xfec0],
    // ARABIC LETTER DAD
    0x0637: [0xfec1, 0xfec2, 0xfec3, 0xfec4],
    // ARABIC LETTER TAH
    0x0638: [0xfec5, 0xfec6, 0xfec7, 0xfec8],
    // ARABIC LETTER ZAH
    0x0639: [0xfec9, 0xfeca, 0xfecb, 0xfecc],
    // ARABIC LETTER AIN
    0x063a: [0xfecd, 0xfece, 0xfecf, 0xfed0],
    // ARABIC LETTER GHAIN
    0x0641: [0xfed1, 0xfed2, 0xfed3, 0xfed4],
    // ARABIC LETTER FEH
    0x0642: [0xfed5, 0xfed6, 0xfed7, 0xfed8],
    // ARABIC LETTER QAF
    0x0643: [0xfed9, 0xfeda, 0xfedb, 0xfedc],
    // ARABIC LETTER KAF
    0x0644: [0xfedd, 0xfede, 0xfedf, 0xfee0],
    // ARABIC LETTER LAM
    0x0645: [0xfee1, 0xfee2, 0xfee3, 0xfee4],
    // ARABIC LETTER MEEM
    0x0646: [0xfee5, 0xfee6, 0xfee7, 0xfee8],
    // ARABIC LETTER NOON
    0x0647: [0xfee9, 0xfeea, 0xfeeb, 0xfeec],
    // ARABIC LETTER HEH
    0x0648: [0xfeed, 0xfeee],
    // ARABIC LETTER WAW
    0x0649: [0xfeef, 0xfef0, 64488, 64489],
    // ARABIC LETTER ALEF MAKSURA
    0x064a: [0xfef1, 0xfef2, 0xfef3, 0xfef4],
    // ARABIC LETTER YEH
    0x0671: [0xfb50, 0xfb51],
    // ARABIC LETTER ALEF WASLA
    0x0677: [0xfbdd],
    // ARABIC LETTER U WITH HAMZA ABOVE
    0x0679: [0xfb66, 0xfb67, 0xfb68, 0xfb69],
    // ARABIC LETTER TTEH
    0x067a: [0xfb5e, 0xfb5f, 0xfb60, 0xfb61],
    // ARABIC LETTER TTEHEH
    0x067b: [0xfb52, 0xfb53, 0xfb54, 0xfb55],
    // ARABIC LETTER BEEH
    0x067e: [0xfb56, 0xfb57, 0xfb58, 0xfb59],
    // ARABIC LETTER PEH
    0x067f: [0xfb62, 0xfb63, 0xfb64, 0xfb65],
    // ARABIC LETTER TEHEH
    0x0680: [0xfb5a, 0xfb5b, 0xfb5c, 0xfb5d],
    // ARABIC LETTER BEHEH
    0x0683: [0xfb76, 0xfb77, 0xfb78, 0xfb79],
    // ARABIC LETTER NYEH
    0x0684: [0xfb72, 0xfb73, 0xfb74, 0xfb75],
    // ARABIC LETTER DYEH
    0x0686: [0xfb7a, 0xfb7b, 0xfb7c, 0xfb7d],
    // ARABIC LETTER TCHEH
    0x0687: [0xfb7e, 0xfb7f, 0xfb80, 0xfb81],
    // ARABIC LETTER TCHEHEH
    0x0688: [0xfb88, 0xfb89],
    // ARABIC LETTER DDAL
    0x068c: [0xfb84, 0xfb85],
    // ARABIC LETTER DAHAL
    0x068d: [0xfb82, 0xfb83],
    // ARABIC LETTER DDAHAL
    0x068e: [0xfb86, 0xfb87],
    // ARABIC LETTER DUL
    0x0691: [0xfb8c, 0xfb8d],
    // ARABIC LETTER RREH
    0x0698: [0xfb8a, 0xfb8b],
    // ARABIC LETTER JEH
    0x06a4: [0xfb6a, 0xfb6b, 0xfb6c, 0xfb6d],
    // ARABIC LETTER VEH
    0x06a6: [0xfb6e, 0xfb6f, 0xfb70, 0xfb71],
    // ARABIC LETTER PEHEH
    0x06a9: [0xfb8e, 0xfb8f, 0xfb90, 0xfb91],
    // ARABIC LETTER KEHEH
    0x06ad: [0xfbd3, 0xfbd4, 0xfbd5, 0xfbd6],
    // ARABIC LETTER NG
    0x06af: [0xfb92, 0xfb93, 0xfb94, 0xfb95],
    // ARABIC LETTER GAF
    0x06b1: [0xfb9a, 0xfb9b, 0xfb9c, 0xfb9d],
    // ARABIC LETTER NGOEH
    0x06b3: [0xfb96, 0xfb97, 0xfb98, 0xfb99],
    // ARABIC LETTER GUEH
    0x06ba: [0xfb9e, 0xfb9f],
    // ARABIC LETTER NOON GHUNNA
    0x06bb: [0xfba0, 0xfba1, 0xfba2, 0xfba3],
    // ARABIC LETTER RNOON
    0x06be: [0xfbaa, 0xfbab, 0xfbac, 0xfbad],
    // ARABIC LETTER HEH DOACHASHMEE
    0x06c0: [0xfba4, 0xfba5],
    // ARABIC LETTER HEH WITH YEH ABOVE
    0x06c1: [0xfba6, 0xfba7, 0xfba8, 0xfba9],
    // ARABIC LETTER HEH GOAL
    0x06c5: [0xfbe0, 0xfbe1],
    // ARABIC LETTER KIRGHIZ OE
    0x06c6: [0xfbd9, 0xfbda],
    // ARABIC LETTER OE
    0x06c7: [0xfbd7, 0xfbd8],
    // ARABIC LETTER U
    0x06c8: [0xfbdb, 0xfbdc],
    // ARABIC LETTER YU
    0x06c9: [0xfbe2, 0xfbe3],
    // ARABIC LETTER KIRGHIZ YU
    0x06cb: [0xfbde, 0xfbdf],
    // ARABIC LETTER VE
    0x06cc: [0xfbfc, 0xfbfd, 0xfbfe, 0xfbff],
    // ARABIC LETTER FARSI YEH
    0x06d0: [0xfbe4, 0xfbe5, 0xfbe6, 0xfbe7],
    //ARABIC LETTER E
    0x06d2: [0xfbae, 0xfbaf],
    // ARABIC LETTER YEH BARREE
    0x06d3: [0xfbb0, 0xfbb1] // ARABIC LETTER YEH BARREE WITH HAMZA ABOVE

  };
  /*
    var ligaturesSubstitutionA = {
        0xFBEA: []// ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH ALEF ISOLATED FORM
    };
    */

  var ligatures = {
    0xfedf: {
      0xfe82: 0xfef5,
      // ARABIC LIGATURE LAM WITH ALEF WITH MADDA ABOVE ISOLATED FORM
      0xfe84: 0xfef7,
      // ARABIC LIGATURE LAM WITH ALEF WITH HAMZA ABOVE ISOLATED FORM
      0xfe88: 0xfef9,
      // ARABIC LIGATURE LAM WITH ALEF WITH HAMZA BELOW ISOLATED FORM
      0xfe8e: 0xfefb // ARABIC LIGATURE LAM WITH ALEF ISOLATED FORM

    },
    0xfee0: {
      0xfe82: 0xfef6,
      // ARABIC LIGATURE LAM WITH ALEF WITH MADDA ABOVE FINAL FORM
      0xfe84: 0xfef8,
      // ARABIC LIGATURE LAM WITH ALEF WITH HAMZA ABOVE FINAL FORM
      0xfe88: 0xfefa,
      // ARABIC LIGATURE LAM WITH ALEF WITH HAMZA BELOW FINAL FORM
      0xfe8e: 0xfefc // ARABIC LIGATURE LAM WITH ALEF FINAL FORM

    },
    0xfe8d: {
      0xfedf: {
        0xfee0: {
          0xfeea: 0xfdf2
        }
      }
    },
    // ALLAH
    0x0651: {
      0x064c: 0xfc5e,
      // Shadda + Dammatan
      0x064d: 0xfc5f,
      // Shadda + Kasratan
      0x064e: 0xfc60,
      // Shadda + Fatha
      0x064f: 0xfc61,
      // Shadda + Damma
      0x0650: 0xfc62 // Shadda + Kasra

    }
  };
  var arabic_diacritics = {
    1612: 64606,
    // Shadda + Dammatan
    1613: 64607,
    // Shadda + Kasratan
    1614: 64608,
    // Shadda + Fatha
    1615: 64609,
    // Shadda + Damma
    1616: 64610 // Shadda + Kasra

  };
  var alfletter = [1570, 1571, 1573, 1575];
  var noChangeInForm = -1;
  var isolatedForm = 0;
  var finalForm = 1;
  var initialForm = 2;
  var medialForm = 3;
  jsPDFAPI.__arabicParser__ = {}; //private

  var isInArabicSubstitutionA = jsPDFAPI.__arabicParser__.isInArabicSubstitutionA = function (letter) {
    return typeof arabicSubstitionA[letter.charCodeAt(0)] !== "undefined";
  };

  var isArabicLetter = jsPDFAPI.__arabicParser__.isArabicLetter = function (letter) {
    return typeof letter === "string" && /^[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]+$/.test(letter);
  };

  var isArabicEndLetter = jsPDFAPI.__arabicParser__.isArabicEndLetter = function (letter) {
    return isArabicLetter(letter) && isInArabicSubstitutionA(letter) && arabicSubstitionA[letter.charCodeAt(0)].length <= 2;
  };

  var isArabicAlfLetter = jsPDFAPI.__arabicParser__.isArabicAlfLetter = function (letter) {
    return isArabicLetter(letter) && alfletter.indexOf(letter.charCodeAt(0)) >= 0;
  };

  jsPDFAPI.__arabicParser__.arabicLetterHasIsolatedForm = function (letter) {
    return isArabicLetter(letter) && isInArabicSubstitutionA(letter) && arabicSubstitionA[letter.charCodeAt(0)].length >= 1;
  };

  var arabicLetterHasFinalForm = jsPDFAPI.__arabicParser__.arabicLetterHasFinalForm = function (letter) {
    return isArabicLetter(letter) && isInArabicSubstitutionA(letter) && arabicSubstitionA[letter.charCodeAt(0)].length >= 2;
  };

  jsPDFAPI.__arabicParser__.arabicLetterHasInitialForm = function (letter) {
    return isArabicLetter(letter) && isInArabicSubstitutionA(letter) && arabicSubstitionA[letter.charCodeAt(0)].length >= 3;
  };

  var arabicLetterHasMedialForm = jsPDFAPI.__arabicParser__.arabicLetterHasMedialForm = function (letter) {
    return isArabicLetter(letter) && isInArabicSubstitutionA(letter) && arabicSubstitionA[letter.charCodeAt(0)].length == 4;
  };

  var resolveLigatures = jsPDFAPI.__arabicParser__.resolveLigatures = function (letters) {
    var i = 0;
    var tmpLigatures = ligatures;
    var result = "";
    var effectedLetters = 0;

    for (i = 0; i < letters.length; i += 1) {
      if (typeof tmpLigatures[letters.charCodeAt(i)] !== "undefined") {
        effectedLetters++;
        tmpLigatures = tmpLigatures[letters.charCodeAt(i)];

        if (typeof tmpLigatures === "number") {
          result += String.fromCharCode(tmpLigatures);
          tmpLigatures = ligatures;
          effectedLetters = 0;
        }

        if (i === letters.length - 1) {
          tmpLigatures = ligatures;
          result += letters.charAt(i - (effectedLetters - 1));
          i = i - (effectedLetters - 1);
          effectedLetters = 0;
        }
      } else {
        tmpLigatures = ligatures;
        result += letters.charAt(i - effectedLetters);
        i = i - effectedLetters;
        effectedLetters = 0;
      }
    }

    return result;
  };

  jsPDFAPI.__arabicParser__.isArabicDiacritic = function (letter) {
    return letter !== undefined && arabic_diacritics[letter.charCodeAt(0)] !== undefined;
  };

  var getCorrectForm = jsPDFAPI.__arabicParser__.getCorrectForm = function (currentChar, beforeChar, nextChar) {
    if (!isArabicLetter(currentChar)) {
      return -1;
    }

    if (isInArabicSubstitutionA(currentChar) === false) {
      return noChangeInForm;
    }

    if (!arabicLetterHasFinalForm(currentChar) || !isArabicLetter(beforeChar) && !isArabicLetter(nextChar) || !isArabicLetter(nextChar) && isArabicEndLetter(beforeChar) || isArabicEndLetter(currentChar) && !isArabicLetter(beforeChar) || isArabicEndLetter(currentChar) && isArabicAlfLetter(beforeChar) || isArabicEndLetter(currentChar) && isArabicEndLetter(beforeChar)) {
      return isolatedForm;
    }

    if (arabicLetterHasMedialForm(currentChar) && isArabicLetter(beforeChar) && !isArabicEndLetter(beforeChar) && isArabicLetter(nextChar) && arabicLetterHasFinalForm(nextChar)) {
      return medialForm;
    }

    if (isArabicEndLetter(currentChar) || !isArabicLetter(nextChar)) {
      return finalForm;
    }

    return initialForm;
  };
  /**
   * @name processArabic
   * @function
   * @param {string} text
   * @returns {string}
   */


  var parseArabic = function parseArabic(text) {
    text = text || "";
    var result = "";
    var i = 0;
    var j = 0;
    var position = 0;
    var currentLetter = "";
    var prevLetter = "";
    var nextLetter = "";
    var words = text.split("\\s+");
    var newWords = [];

    for (i = 0; i < words.length; i += 1) {
      newWords.push("");

      for (j = 0; j < words[i].length; j += 1) {
        currentLetter = words[i][j];
        prevLetter = words[i][j - 1];
        nextLetter = words[i][j + 1];

        if (isArabicLetter(currentLetter)) {
          position = getCorrectForm(currentLetter, prevLetter, nextLetter);

          if (position !== -1) {
            newWords[i] += String.fromCharCode(arabicSubstitionA[currentLetter.charCodeAt(0)][position]);
          } else {
            newWords[i] += currentLetter;
          }
        } else {
          newWords[i] += currentLetter;
        }
      }

      newWords[i] = resolveLigatures(newWords[i]);
    }

    result = newWords.join(" ");
    return result;
  };

  var processArabic = jsPDFAPI.__arabicParser__.processArabic = jsPDFAPI.processArabic = function () {
    var text = typeof arguments[0] === "string" ? arguments[0] : arguments[0].text;
    var tmpText = [];
    var result;

    if (Array.isArray(text)) {
      var i = 0;
      tmpText = [];

      for (i = 0; i < text.length; i += 1) {
        if (Array.isArray(text[i])) {
          tmpText.push([parseArabic(text[i][0]), text[i][1], text[i][2]]);
        } else {
          tmpText.push([parseArabic(text[i])]);
        }
      }

      result = tmpText;
    } else {
      result = parseArabic(text);
    }

    if (typeof arguments[0] === "string") {
      return result;
    } else {
      arguments[0].text = result;
      return arguments[0];
    }
  };

  jsPDFAPI.events.push(["preProcessText", processArabic]);
})(jsPDF.API);

/* global jsPDF */

/** @license
 * jsPDF Autoprint Plugin
 *
 * Licensed under the MIT License.
 * https://opensource.org/licenses/mit-license
 */

/**
 * @name autoprint
 * @module
 */
(function (jsPDFAPI) {
  /**
   * Makes the PDF automatically open the print-Dialog when opened in a PDF-viewer.
   *
   * @name autoPrint
   * @function
   * @param {Object} options (optional) Set the attribute variant to 'non-conform' (default) or 'javascript' to activate different methods of automatic printing when opening in a PDF-viewer .
   * @returns {jsPDF}
   * @example
   * var doc = new jsPDF();
   * doc.text(10, 10, 'This is a test');
   * doc.autoPrint({variant: 'non-conform'});
   * doc.save('autoprint.pdf');
   */

  jsPDFAPI.autoPrint = function (options) {

    var refAutoPrintTag;
    options = options || {};
    options.variant = options.variant || "non-conform";

    switch (options.variant) {
      case "javascript":
        //https://github.com/Rob--W/pdf.js/commit/c676ecb5a0f54677b9f3340c3ef2cf42225453bb
        this.addJS("print({});");
        break;

      case "non-conform":
      default:
        this.internal.events.subscribe("postPutResources", function () {
          refAutoPrintTag = this.internal.newObject();
          this.internal.out("<<");
          this.internal.out("/S /Named");
          this.internal.out("/Type /Action");
          this.internal.out("/N /Print");
          this.internal.out(">>");
          this.internal.out("endobj");
        });
        this.internal.events.subscribe("putCatalog", function () {
          this.internal.out("/OpenAction " + refAutoPrintTag + " 0 R");
        });
        break;
    }

    return this;
  };
})(jsPDF.API);

/* global jsPDF */

/**
 * @license
 * Copyright (c) 2014 Steven Spungin (TwelveTone LLC)  steven@twelvetone.tv
 *
 * Licensed under the MIT License.
 * https://opensource.org/licenses/mit-license
 */

/**
 * jsPDF Canvas PlugIn
 * This plugin mimics the HTML5 Canvas
 *
 * The goal is to provide a way for current canvas users to print directly to a PDF.
 * @name canvas
 * @module
 */
(function (jsPDFAPI) {
  /**
   * @class Canvas
   * @classdesc A Canvas Wrapper for jsPDF
   */

  var Canvas = function Canvas() {
    var jsPdfInstance = undefined;
    Object.defineProperty(this, "pdf", {
      get: function get() {
        return jsPdfInstance;
      },
      set: function set(value) {
        jsPdfInstance = value;
      }
    });
    var _width = 150;
    /**
     * The height property is a positive integer reflecting the height HTML attribute of the <canvas> element interpreted in CSS pixels. When the attribute is not specified, or if it is set to an invalid value, like a negative, the default value of 150 is used.
     * This is one of the two properties, the other being width, that controls the size of the canvas.
     *
     * @name width
     */

    Object.defineProperty(this, "width", {
      get: function get() {
        return _width;
      },
      set: function set(value) {
        if (isNaN(value) || Number.isInteger(value) === false || value < 0) {
          _width = 150;
        } else {
          _width = value;
        }

        if (this.getContext("2d").pageWrapXEnabled) {
          this.getContext("2d").pageWrapX = _width + 1;
        }
      }
    });
    var _height = 300;
    /**
     * The width property is a positive integer reflecting the width HTML attribute of the <canvas> element interpreted in CSS pixels. When the attribute is not specified, or if it is set to an invalid value, like a negative, the default value of 300 is used.
     * This is one of the two properties, the other being height, that controls the size of the canvas.
     *
     * @name height
     */

    Object.defineProperty(this, "height", {
      get: function get() {
        return _height;
      },
      set: function set(value) {
        if (isNaN(value) || Number.isInteger(value) === false || value < 0) {
          _height = 300;
        } else {
          _height = value;
        }

        if (this.getContext("2d").pageWrapYEnabled) {
          this.getContext("2d").pageWrapY = _height + 1;
        }
      }
    });
    var _childNodes = [];
    Object.defineProperty(this, "childNodes", {
      get: function get() {
        return _childNodes;
      },
      set: function set(value) {
        _childNodes = value;
      }
    });
    var _style = {};
    Object.defineProperty(this, "style", {
      get: function get() {
        return _style;
      },
      set: function set(value) {
        _style = value;
      }
    });
    Object.defineProperty(this, "parentNode", {});
  };
  /**
   * The getContext() method returns a drawing context on the canvas, or null if the context identifier is not supported.
   *
   * @name getContext
   * @function
   * @param {string} contextType Is a String containing the context identifier defining the drawing context associated to the canvas. Possible value is "2d", leading to the creation of a Context2D object representing a two-dimensional rendering context.
   * @param {object} contextAttributes
   */


  Canvas.prototype.getContext = function (contextType, contextAttributes) {
    contextType = contextType || "2d";
    var key;

    if (contextType !== "2d") {
      return null;
    }

    for (key in contextAttributes) {
      if (this.pdf.context2d.hasOwnProperty(key)) {
        this.pdf.context2d[key] = contextAttributes[key];
      }
    }

    this.pdf.context2d._canvas = this;
    return this.pdf.context2d;
  };
  /**
   * The toDataURL() method is just a stub to throw an error if accidently called.
   *
   * @name toDataURL
   * @function
   */


  Canvas.prototype.toDataURL = function () {
    throw new Error("toDataURL is not implemented.");
  };

  jsPDFAPI.events.push(["initialized", function () {
    this.canvas = new Canvas();
    this.canvas.pdf = this;
  }]);
  return this;
})(jsPDF.API);

/*global jsPDF */

/**
 * @license
 * ====================================================================
 * Copyright (c) 2013 Youssef Beddad, youssef.beddad@gmail.com
 *               2013 Eduardo Menezes de Morais, eduardo.morais@usp.br
 *               2013 Lee Driscoll, https://github.com/lsdriscoll
 *               2014 Juan Pablo Gaviria, https://github.com/juanpgaviria
 *               2014 James Hall, james@parall.ax
 *               2014 Diego Casorran, https://github.com/diegocr
 *
 * 
 * ====================================================================
 */

/**
 * @name cell
 * @module
 */
(function (jsPDFAPI) {

  var NO_MARGINS = {
    left: 0,
    top: 0,
    bottom: 0,
    right: 0
  };
  var px2pt = 0.264583 * 72 / 25.4;
  var printingHeaderRow = false;

  var _initialize = function _initialize() {
    if (typeof this.internal.__cell__ === "undefined") {
      this.internal.__cell__ = {};
      this.internal.__cell__.padding = 3;
      this.internal.__cell__.headerFunction = undefined;
      this.internal.__cell__.margins = Object.assign({}, NO_MARGINS);
      this.internal.__cell__.margins.width = this.getPageWidth();

      _reset.call(this);
    }
  };

  var _reset = function _reset() {
    this.internal.__cell__.lastCell = new Cell();
    this.internal.__cell__.pages = 1;
  };

  var Cell = function Cell() {
    var _x = arguments[0];
    Object.defineProperty(this, "x", {
      enumerable: true,
      get: function get() {
        return _x;
      },
      set: function set(value) {
        _x = value;
      }
    });
    var _y = arguments[1];
    Object.defineProperty(this, "y", {
      enumerable: true,
      get: function get() {
        return _y;
      },
      set: function set(value) {
        _y = value;
      }
    });
    var _width = arguments[2];
    Object.defineProperty(this, "width", {
      enumerable: true,
      get: function get() {
        return _width;
      },
      set: function set(value) {
        _width = value;
      }
    });
    var _height = arguments[3];
    Object.defineProperty(this, "height", {
      enumerable: true,
      get: function get() {
        return _height;
      },
      set: function set(value) {
        _height = value;
      }
    });
    var _text = arguments[4];
    Object.defineProperty(this, "text", {
      enumerable: true,
      get: function get() {
        return _text;
      },
      set: function set(value) {
        _text = value;
      }
    });
    var _lineNumber = arguments[5];
    Object.defineProperty(this, "lineNumber", {
      enumerable: true,
      get: function get() {
        return _lineNumber;
      },
      set: function set(value) {
        _lineNumber = value;
      }
    });
    var _align = arguments[6];
    Object.defineProperty(this, "align", {
      enumerable: true,
      get: function get() {
        return _align;
      },
      set: function set(value) {
        _align = value;
      }
    });
    return this;
  };

  Cell.prototype.clone = function () {
    return new Cell(this.x, this.y, this.width, this.height, this.text, this.lineNumber, this.align);
  };

  Cell.prototype.toArray = function () {
    return [this.x, this.y, this.width, this.height, this.text, this.lineNumber, this.align];
  };
  /**
   * @name setHeaderFunction
   * @function
   * @param {function} func
   */


  jsPDFAPI.setHeaderFunction = function (func) {
    _initialize.call(this);

    this.internal.__cell__.headerFunction = typeof func === "function" ? func : undefined;
    return this;
  };
  /**
   * @name getTextDimensions
   * @function
   * @param {string} txt
   * @returns {Object} dimensions
   */


  jsPDFAPI.getTextDimensions = function (text, options) {
    _initialize.call(this);

    options = options || {};
    var fontSize = options.fontSize || this.getFontSize();
    var font = options.font || this.getFont();
    var scaleFactor = options.scaleFactor || this.internal.scaleFactor;
    var width = 0;
    var amountOfLines = 0;
    var height = 0;
    var tempWidth = 0;

    if (!Array.isArray(text) && typeof text !== "string") {
      throw new Error("getTextDimensions expects text-parameter to be of type String or an Array of Strings.");
    }

    text = Array.isArray(text) ? text : [text];

    for (var i = 0; i < text.length; i++) {
      tempWidth = this.getStringUnitWidth(text[i], {
        font: font
      }) * fontSize;

      if (width < tempWidth) {
        width = tempWidth;
      }

      if (width !== 0) {
        amountOfLines = text.length;
      }
    }

    width = width / scaleFactor;
    height = Math.max((amountOfLines * fontSize * this.getLineHeightFactor() - fontSize * (this.getLineHeightFactor() - 1)) / scaleFactor, 0);
    return {
      w: width,
      h: height
    };
  };
  /**
   * @name cellAddPage
   * @function
   */


  jsPDFAPI.cellAddPage = function () {
    _initialize.call(this);

    this.addPage();
    var margins = this.internal.__cell__.margins || NO_MARGINS;
    this.internal.__cell__.lastCell = new Cell(margins.left, margins.top, undefined, undefined);
    this.internal.__cell__.pages += 1;
    return this;
  };
  /**
   * @name cellInitialize
   * @function
   * @deprecated
   */


  jsPDFAPI.cellInitialize = function () {
    _initialize.call(this);

    _reset.call(this);
  };
  /**
   * @name cell
   * @function
   * @param {number} x
   * @param {number} y
   * @param {number} width
   * @param {number} height
   * @param {string} text
   * @param {number} lineNumber lineNumber
   * @param {string} align
   * @return {jsPDF} jsPDF-instance
   */


  var cell = jsPDFAPI.cell = function () {
    var currentCell;

    if (arguments[0] instanceof Cell) {
      currentCell = arguments[0];
    } else {
      currentCell = new Cell(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
    }

    _initialize.call(this);

    var lastCell = this.internal.__cell__.lastCell;
    var padding = this.internal.__cell__.padding;
    var margins = this.internal.__cell__.margins || NO_MARGINS;
    var tableHeaderRow = this.internal.__cell__.tableHeaderRow;
    var printHeaders = this.internal.__cell__.printHeaders; // If this is not the first cell, we must change its position

    if (typeof lastCell.lineNumber !== "undefined") {
      if (lastCell.lineNumber === currentCell.lineNumber) {
        //Same line
        currentCell.x = (lastCell.x || 0) + (lastCell.width || 0);
        currentCell.y = lastCell.y || 0;
      } else {
        //New line
        if (lastCell.y + lastCell.height + currentCell.height + margins.bottom > this.getPageHeight()) {
          this.cellAddPage();
          currentCell.y = margins.top;

          if (printHeaders && tableHeaderRow) {
            this.printHeaderRow(currentCell.lineNumber, true);
            currentCell.y += tableHeaderRow[0].height;
          }
        } else {
          currentCell.y = lastCell.y + lastCell.height || currentCell.y;
        }
      }
    }

    if (typeof currentCell.text[0] !== "undefined") {
      this.rect(currentCell.x, currentCell.y, currentCell.width, currentCell.height, printingHeaderRow === true ? "FD" : undefined);

      if (currentCell.align === "right") {
        this.text(currentCell.text, currentCell.x + currentCell.width - padding, currentCell.y + padding, {
          align: "right",
          baseline: "top"
        });
      } else if (currentCell.align === "center") {
        this.text(currentCell.text, currentCell.x + currentCell.width / 2, currentCell.y + padding, {
          align: "center",
          baseline: "top",
          maxWidth: currentCell.width - padding - padding
        });
      } else {
        this.text(currentCell.text, currentCell.x + padding, currentCell.y + padding, {
          align: "left",
          baseline: "top",
          maxWidth: currentCell.width - padding - padding
        });
      }
    }

    this.internal.__cell__.lastCell = currentCell;
    return this;
  };
  /**
     * Create a table from a set of data.
     * @name table
     * @function
     * @param {Integer} [x] : left-position for top-left corner of table
     * @param {Integer} [y] top-position for top-left corner of table
     * @param {Object[]} [data] An array of objects containing key-value pairs corresponding to a row of data.
     * @param {String[]} [headers] Omit or null to auto-generate headers at a performance cost
       * @param {Object} [config.printHeaders] True to print column headers at the top of every page
     * @param {Object} [config.autoSize] True to dynamically set the column widths to match the widest cell value
     * @param {Object} [config.margins] margin values for left, top, bottom, and width
     * @param {Object} [config.fontSize] Integer fontSize to use (optional)
     * @param {Object} [config.padding] cell-padding in pt to use (optional)
     * @param {Object} [config.headerBackgroundColor] default is #c8c8c8 (optional)
     * @returns {jsPDF} jsPDF-instance
     */


  jsPDFAPI.table = function (x, y, data, headers, config) {
    _initialize.call(this);

    if (!data) {
      throw new Error("No data for PDF table.");
    }

    config = config || {};
    var headerNames = [],
        headerLabels = [],
        headerAligns = [],
        i,
        columnMatrix = {},
        columnWidths = {},
        column,
        columnMinWidths = [],
        j,
        tableHeaderConfigs = [],
        //set up defaults. If a value is provided in config, defaults will be overwritten:
    autoSize = config.autoSize || false,
        printHeaders = config.printHeaders === false ? false : true,
        fontSize = config.css && typeof config.css["font-size"] !== "undefined" ? config.css["font-size"] * 16 : config.fontSize || 12,
        margins = config.margins || Object.assign({
      width: this.getPageWidth()
    }, NO_MARGINS),
        padding = typeof config.padding === "number" ? config.padding : 3,
        headerBackgroundColor = config.headerBackgroundColor || "#c8c8c8";

    _reset.call(this);

    this.internal.__cell__.printHeaders = printHeaders;
    this.internal.__cell__.margins = margins;
    this.internal.__cell__.table_font_size = fontSize;
    this.internal.__cell__.padding = padding;
    this.internal.__cell__.headerBackgroundColor = headerBackgroundColor;
    this.setFontSize(fontSize); // Set header values

    if (headers === undefined || headers === null) {
      // No headers defined so we derive from data
      headerNames = Object.keys(data[0]);
      headerLabels = headerNames;
      headerAligns = headerNames.map(function () {
        return "left";
      });
    } else if (Array.isArray(headers) && _typeof(headers[0]) === "object") {
      headerNames = headers.map(function (header) {
        return header.name;
      });
      headerLabels = headers.map(function (header) {
        return header.prompt || header.name || "";
      });
      headerAligns = headerNames.map(function (header) {
        return header.align || "left";
      }); // Split header configs into names and prompts

      for (i = 0; i < headers.length; i += 1) {
        columnWidths[headers[i].name] = headers[i].width * px2pt;
      }
    } else if (Array.isArray(headers) && typeof headers[0] === "string") {
      headerNames = headers;
      headerLabels = headerNames;
      headerAligns = headerNames.map(function () {
        return "left";
      });
    }

    if (autoSize) {
      var headerName;

      for (i = 0; i < headerNames.length; i += 1) {
        headerName = headerNames[i]; // Create a matrix of columns e.g., {column_title: [row1_Record, row2_Record]}

        columnMatrix[headerName] = data.map(function (rec) {
          return rec[headerName];
        }); // get header width

        this.setFontStyle("bold");
        columnMinWidths.push(this.getTextDimensions(headerLabels[i], {
          fontSize: this.internal.__cell__.table_font_size,
          scaleFactor: this.internal.scaleFactor
        }).w);
        column = columnMatrix[headerName]; // get cell widths

        this.setFontStyle("normal");

        for (j = 0; j < column.length; j += 1) {
          columnMinWidths.push(this.getTextDimensions(column[j], {
            fontSize: this.internal.__cell__.table_font_size,
            scaleFactor: this.internal.scaleFactor
          }).w);
        } // get final column width


        columnWidths[headerName] = Math.max.apply(null, columnMinWidths) + padding + padding; //have to reset

        columnMinWidths = [];
      }
    } // -- Construct the table


    if (printHeaders) {
      var row = {};

      for (i = 0; i < headerNames.length; i += 1) {
        row[headerNames[i]] = {};
        row[headerNames[i]].text = headerLabels[i];
        row[headerNames[i]].align = headerAligns[i];
      }

      var rowHeight = calculateLineHeight.call(this, row, columnWidths); // Construct the header row

      tableHeaderConfigs = headerNames.map(function (value) {
        return new Cell(x, y, columnWidths[value], rowHeight, row[value].text, undefined, row[value].align);
      }); // Store the table header config

      this.setTableHeaderRow(tableHeaderConfigs); // Print the header for the start of the table

      this.printHeaderRow(1, false);
    } // Construct the data rows


    var align = headers.reduce(function (pv, cv) {
      pv[cv.name] = cv.align;
      return pv;
    }, {});

    for (i = 0; i < data.length; i += 1) {
      var lineHeight = calculateLineHeight.call(this, data[i], columnWidths);

      for (j = 0; j < headerNames.length; j += 1) {
        cell.call(this, new Cell(x, y, columnWidths[headerNames[j]], lineHeight, data[i][headerNames[j]], i + 2, align[headerNames[j]]));
      }
    }

    this.internal.__cell__.table_x = x;
    this.internal.__cell__.table_y = y;
    return this;
  };
  /**
   * Calculate the height for containing the highest column
   *
   * @name calculateLineHeight
   * @function
   * @param {Object[]} model is the line of data we want to calculate the height of
   * @param {Integer[]} columnWidths is size of each column
   * @returns {number} lineHeight
   * @private
   */


  var calculateLineHeight = function calculateLineHeight(model, columnWidths) {
    var padding = this.internal.__cell__.padding;
    var fontSize = this.internal.__cell__.table_font_size;
    var scaleFactor = this.internal.scaleFactor;
    return Object.keys(model).map(function (value) {
      return _typeof(value) === "object" ? value.text : value;
    }).map(function (value) {
      return this.splitTextToSize(value, columnWidths[value] - padding - padding);
    }, this).map(function (value) {
      return this.getLineHeightFactor() * value.length * fontSize / scaleFactor + padding + padding;
    }, this).reduce(function (pv, cv) {
      return Math.max(pv, cv);
    }, 0);
  };
  /**
   * Store the config for outputting a table header
   *
   * @name setTableHeaderRow
   * @function
   * @param {Object[]} config
   * An array of cell configs that would define a header row: Each config matches the config used by jsPDFAPI.cell
   * except the lineNumber parameter is excluded
   */


  jsPDFAPI.setTableHeaderRow = function (config) {
    _initialize.call(this);

    this.internal.__cell__.tableHeaderRow = config;
  };
  /**
   * Output the store header row
   *
   * @name printHeaderRow
   * @function
   * @param {number} lineNumber The line number to output the header at
   * @param {boolean} new_page
   */


  jsPDFAPI.printHeaderRow = function (lineNumber, new_page) {
    _initialize.call(this);

    if (!this.internal.__cell__.tableHeaderRow) {
      throw new Error("Property tableHeaderRow does not exist.");
    }

    var tableHeaderCell;
    printingHeaderRow = true;

    if (typeof this.internal.__cell__.headerFunction === "function") {
      var position = this.internal.__cell__.headerFunction(this, this.internal.__cell__.pages);

      this.internal.__cell__.lastCell = new Cell(position[0], position[1], position[2], position[3], undefined, -1);
    }

    this.setFontStyle("bold");
    var tempHeaderConf = [];

    for (var i = 0; i < this.internal.__cell__.tableHeaderRow.length; i += 1) {
      tableHeaderCell = this.internal.__cell__.tableHeaderRow[i].clone();

      if (new_page) {
        tableHeaderCell.y = this.internal.__cell__.margins.top || 0;
        tempHeaderConf.push(tableHeaderCell);
      }

      tableHeaderCell.lineNumber = lineNumber;
      this.setFillColor(this.internal.__cell__.headerBackgroundColor);
      cell.call(this, tableHeaderCell);
    }

    if (tempHeaderConf.length > 0) {
      this.setTableHeaderRow(tempHeaderConf);
    }

    this.setFontStyle("normal");
    printingHeaderRow = false;
  };
})(jsPDF.API);

/* eslint-disable no-fallthrough */

/* eslint-disable no-console */

/* global jsPDF, RGBColor */

/**
 * jsPDF Context2D PlugIn Copyright (c) 2014 Steven Spungin (TwelveTone LLC) steven@twelvetone.tv
 *
 * Licensed under the MIT License. https://opensource.org/licenses/mit-license
 */

/**
 * This plugin mimics the HTML5 CanvasRenderingContext2D.
 *
 * The goal is to provide a way for current canvas implementations to print directly to a PDF.
 *
 * @name context2d
 * @module
 */
(function (jsPDFAPI) {

  var ContextLayer = function ContextLayer(ctx) {
    ctx = ctx || {};
    this.isStrokeTransparent = ctx.isStrokeTransparent || false;
    this.strokeOpacity = ctx.strokeOpacity || 1;
    this.strokeStyle = ctx.strokeStyle || "#000000";
    this.fillStyle = ctx.fillStyle || "#000000";
    this.isFillTransparent = ctx.isFillTransparent || false;
    this.fillOpacity = ctx.fillOpacity || 1;
    this.font = ctx.font || "10px sans-serif";
    this.textBaseline = ctx.textBaseline || "alphabetic";
    this.textAlign = ctx.textAlign || "left";
    this.lineWidth = ctx.lineWidth || 1;
    this.lineJoin = ctx.lineJoin || "miter";
    this.lineCap = ctx.lineCap || "butt";
    this.path = ctx.path || [];
    this.transform = typeof ctx.transform !== "undefined" ? ctx.transform.clone() : new Matrix();
    this.globalCompositeOperation = ctx.globalCompositeOperation || "normal";
    this.globalAlpha = ctx.globalAlpha || 1.0;
    this.clip_path = ctx.clip_path || [];
    this.currentPoint = ctx.currentPoint || new Point();
    this.miterLimit = ctx.miterLimit || 10.0;
    this.lastPoint = ctx.lastPoint || new Point();
    this.ignoreClearRect = typeof ctx.ignoreClearRect === "boolean" ? ctx.ignoreClearRect : true;
    return this;
  }; //stub


  var f2, getHorizontalCoordinateString, getVerticalCoordinateString, getHorizontalCoordinate, getVerticalCoordinate, Point, Rectangle, Matrix, _ctx;

  jsPDFAPI.events.push(["initialized", function () {
    this.context2d = new Context2D(this);
    f2 = this.internal.f2;
    getHorizontalCoordinateString = this.internal.getCoordinateString;
    getVerticalCoordinateString = this.internal.getVerticalCoordinateString;
    getHorizontalCoordinate = this.internal.getHorizontalCoordinate;
    getVerticalCoordinate = this.internal.getVerticalCoordinate;
    Point = this.internal.Point;
    Rectangle = this.internal.Rectangle;
    Matrix = this.internal.Matrix;
    _ctx = new ContextLayer();
  }]);

  var Context2D = function Context2D(pdf) {
    Object.defineProperty(this, "canvas", {
      get: function get() {
        return {
          parentNode: false,
          style: false
        };
      }
    });
    var _pdf = pdf;
    Object.defineProperty(this, "pdf", {
      get: function get() {
        return _pdf;
      }
    });
    var _pageWrapXEnabled = false;
    /**
     * @name pageWrapXEnabled
     * @type {boolean}
     * @default false
     */

    Object.defineProperty(this, "pageWrapXEnabled", {
      get: function get() {
        return _pageWrapXEnabled;
      },
      set: function set(value) {
        _pageWrapXEnabled = Boolean(value);
      }
    });
    var _pageWrapYEnabled = false;
    /**
     * @name pageWrapYEnabled
     * @type {boolean}
     * @default true
     */

    Object.defineProperty(this, "pageWrapYEnabled", {
      get: function get() {
        return _pageWrapYEnabled;
      },
      set: function set(value) {
        _pageWrapYEnabled = Boolean(value);
      }
    });
    var _posX = 0;
    /**
     * @name posX
     * @type {number}
     * @default 0
     */

    Object.defineProperty(this, "posX", {
      get: function get() {
        return _posX;
      },
      set: function set(value) {
        if (!isNaN(value)) {
          _posX = value;
        }
      }
    });
    var _posY = 0;
    /**
     * @name posY
     * @type {number}
     * @default 0
     */

    Object.defineProperty(this, "posY", {
      get: function get() {
        return _posY;
      },
      set: function set(value) {
        if (!isNaN(value)) {
          _posY = value;
        }
      }
    });
    var _autoPaging = false;
    /**
     * @name autoPaging
     * @type {boolean}
     * @default true
     */

    Object.defineProperty(this, "autoPaging", {
      get: function get() {
        return _autoPaging;
      },
      set: function set(value) {
        _autoPaging = Boolean(value);
      }
    });
    var lastBreak = 0;
    /**
     * @name lastBreak
     * @type {number}
     * @default 0
     */

    Object.defineProperty(this, "lastBreak", {
      get: function get() {
        return lastBreak;
      },
      set: function set(value) {
        lastBreak = value;
      }
    });
    var pageBreaks = [];
    /**
     * Y Position of page breaks.
     * @name pageBreaks
     * @type {number}
     * @default 0
     */

    Object.defineProperty(this, "pageBreaks", {
      get: function get() {
        return pageBreaks;
      },
      set: function set(value) {
        pageBreaks = value;
      }
    });
    /**
     * @name ctx
     * @type {object}
     * @default {}
     */

    Object.defineProperty(this, "ctx", {
      get: function get() {
        return _ctx;
      },
      set: function set(value) {
        if (value instanceof ContextLayer) {
          _ctx = value;
        }
      }
    });
    /**
     * @name path
     * @type {array}
     * @default []
     */

    Object.defineProperty(this, "path", {
      get: function get() {
        return _ctx.path;
      },
      set: function set(value) {
        _ctx.path = value;
      }
    });
    /**
     * @name ctxStack
     * @type {array}
     * @default []
     */

    var _ctxStack = [];
    Object.defineProperty(this, "ctxStack", {
      get: function get() {
        return _ctxStack;
      },
      set: function set(value) {
        _ctxStack = value;
      }
    });
    /**
     * Sets or returns the color, gradient, or pattern used to fill the drawing
     *
     * @name fillStyle
     * @default #000000
     * @property {(color|gradient|pattern)} value The color of the drawing. Default value is #000000<br />
     * A gradient object (linear or radial) used to fill the drawing (not supported by context2d)<br />
     * A pattern object to use to fill the drawing (not supported by context2d)
     */

    Object.defineProperty(this, "fillStyle", {
      get: function get() {
        return this.ctx.fillStyle;
      },
      set: function set(value) {
        var rgba;
        rgba = getRGBA(value);
        this.ctx.fillStyle = rgba.style;
        this.ctx.isFillTransparent = rgba.a === 0;
        this.ctx.fillOpacity = rgba.a;
        this.pdf.setFillColor(rgba.r, rgba.g, rgba.b, {
          a: rgba.a
        });
        this.pdf.setTextColor(rgba.r, rgba.g, rgba.b, {
          a: rgba.a
        });
      }
    });
    /**
     * Sets or returns the color, gradient, or pattern used for strokes
     *
     * @name strokeStyle
     * @default #000000
     * @property {color} color A CSS color value that indicates the stroke color of the drawing. Default value is #000000 (not supported by context2d)
     * @property {gradient} gradient A gradient object (linear or radial) used to create a gradient stroke (not supported by context2d)
     * @property {pattern} pattern A pattern object used to create a pattern stroke (not supported by context2d)
     */

    Object.defineProperty(this, "strokeStyle", {
      get: function get() {
        return this.ctx.strokeStyle;
      },
      set: function set(value) {
        var rgba = getRGBA(value);
        this.ctx.strokeStyle = rgba.style;
        this.ctx.isStrokeTransparent = rgba.a === 0;
        this.ctx.strokeOpacity = rgba.a;

        if (rgba.a === 0) {
          this.pdf.setDrawColor(255, 255, 255);
        } else if (rgba.a === 1) {
          this.pdf.setDrawColor(rgba.r, rgba.g, rgba.b);
        } else {
          this.pdf.setDrawColor(rgba.r, rgba.g, rgba.b);
        }
      }
    });
    /**
     * Sets or returns the style of the end caps for a line
     *
     * @name lineCap
     * @default butt
     * @property {(butt|round|square)} lineCap butt A flat edge is added to each end of the line <br/>
     * round A rounded end cap is added to each end of the line<br/>
     * square A square end cap is added to each end of the line<br/>
     */

    Object.defineProperty(this, "lineCap", {
      get: function get() {
        return this.ctx.lineCap;
      },
      set: function set(value) {
        if (["butt", "round", "square"].indexOf(value) !== -1) {
          this.ctx.lineCap = value;
          this.pdf.setLineCap(value);
        }
      }
    });
    /**
     * Sets or returns the current line width
     *
     * @name lineWidth
     * @default 1
     * @property {number} lineWidth The current line width, in pixels
     */

    Object.defineProperty(this, "lineWidth", {
      get: function get() {
        return this.ctx.lineWidth;
      },
      set: function set(value) {
        if (!isNaN(value)) {
          this.ctx.lineWidth = value;
          this.pdf.setLineWidth(value);
        }
      }
    });
    /**
     * Sets or returns the type of corner created, when two lines meet
     */

    Object.defineProperty(this, "lineJoin", {
      get: function get() {
        return this.ctx.lineJoin;
      },
      set: function set(value) {
        if (["bevel", "round", "miter"].indexOf(value) !== -1) {
          this.ctx.lineJoin = value;
          this.pdf.setLineJoin(value);
        }
      }
    });
    /**
     * A number specifying the miter limit ratio in coordinate space units. Zero, negative, Infinity, and NaN values are ignored. The default value is 10.0.
     *
     * @name miterLimit
     * @default 10
     */

    Object.defineProperty(this, "miterLimit", {
      get: function get() {
        return this.ctx.miterLimit;
      },
      set: function set(value) {
        if (!isNaN(value)) {
          this.ctx.miterLimit = value;
          this.pdf.setMiterLimit(value);
        }
      }
    });
    Object.defineProperty(this, "textBaseline", {
      get: function get() {
        return this.ctx.textBaseline;
      },
      set: function set(value) {
        this.ctx.textBaseline = value;
      }
    });
    Object.defineProperty(this, "textAlign", {
      get: function get() {
        return this.ctx.textAlign;
      },
      set: function set(value) {
        if (["right", "end", "center", "left", "start"].indexOf(value) !== -1) {
          this.ctx.textAlign = value;
        }
      }
    });
    Object.defineProperty(this, "font", {
      get: function get() {
        return this.ctx.font;
      },
      set: function set(value) {
        this.ctx.font = value;
        var rx, matches; //source: https://stackoverflow.com/a/10136041
        // eslint-disable-next-line no-useless-escape

        rx = /^\s*(?=(?:(?:[-a-z]+\s*){0,2}(italic|oblique))?)(?=(?:(?:[-a-z]+\s*){0,2}(small-caps))?)(?=(?:(?:[-a-z]+\s*){0,2}(bold(?:er)?|lighter|[1-9]00))?)(?:(?:normal|\1|\2|\3)\s*){0,3}((?:xx?-)?(?:small|large)|medium|smaller|larger|[.\d]+(?:\%|in|[cem]m|ex|p[ctx]))(?:\s*\/\s*(normal|[.\d]+(?:\%|in|[cem]m|ex|p[ctx])))?\s*([-_,\"\'\sa-z]+?)\s*$/i;
        matches = rx.exec(value);

        if (matches !== null) {
          var fontStyle = matches[1];
          var fontVariant = matches[2];
          var fontWeight = matches[3];
          var fontSize = matches[4];
          var lineHeight = matches[5];
          var fontFamily = matches[6];
        } else {
          return;
        }

        var rxFontSize = /^([.\d]+)((?:%|in|[cem]m|ex|p[ctx]))$/i;
        var fontSizeUnit = rxFontSize.exec(fontSize)[2];

        if ("px" === fontSizeUnit) {
          fontSize = Math.floor(parseFloat(fontSize));
        } else if ("em" === fontSizeUnit) {
          fontSize = Math.floor(parseFloat(fontSize) * this.pdf.getFontSize());
        } else {
          fontSize = Math.floor(parseFloat(fontSize));
        }

        this.pdf.setFontSize(fontSize);
        var style = "";

        if (fontWeight === "bold" || parseInt(fontWeight, 10) >= 700 || fontStyle === "bold") {
          style = "bold";
        }

        if (fontStyle === "italic") {
          style += "italic";
        }

        if (style.length === 0) {
          style = "normal";
        }

        var jsPdfFontName = "";
        var parts = fontFamily.toLowerCase().replace(/"|'/g, "").split(/\s*,\s*/);
        var fallbackFonts = {
          arial: "Helvetica",
          verdana: "Helvetica",
          helvetica: "Helvetica",
          "sans-serif": "Helvetica",
          fixed: "Courier",
          monospace: "Courier",
          terminal: "Courier",
          courier: "Courier",
          times: "Times",
          cursive: "Times",
          fantasy: "Times",
          serif: "Times"
        };

        for (var i = 0; i < parts.length; i++) {
          if (this.pdf.internal.getFont(parts[i], style, {
            noFallback: true,
            disableWarning: true
          }) !== undefined) {
            jsPdfFontName = parts[i];
            break;
          } else if (style === "bolditalic" && this.pdf.internal.getFont(parts[i], "bold", {
            noFallback: true,
            disableWarning: true
          }) !== undefined) {
            jsPdfFontName = parts[i];
            style = "bold";
          } else if (this.pdf.internal.getFont(parts[i], "normal", {
            noFallback: true,
            disableWarning: true
          }) !== undefined) {
            jsPdfFontName = parts[i];
            style = "normal";
            break;
          }
        }

        if (jsPdfFontName === "") {
          for (var j = 0; j < parts.length; j++) {
            if (fallbackFonts[parts[j]]) {
              jsPdfFontName = fallbackFonts[parts[j]];
              break;
            }
          }
        }

        jsPdfFontName = jsPdfFontName === "" ? "Times" : jsPdfFontName;
        this.pdf.setFont(jsPdfFontName, style);
      }
    });
    Object.defineProperty(this, "globalCompositeOperation", {
      get: function get() {
        return this.ctx.globalCompositeOperation;
      },
      set: function set(value) {
        this.ctx.globalCompositeOperation = value;
      }
    });
    Object.defineProperty(this, "globalAlpha", {
      get: function get() {
        return this.ctx.globalAlpha;
      },
      set: function set(value) {
        this.ctx.globalAlpha = value;
      }
    }); // Not HTML API

    Object.defineProperty(this, "ignoreClearRect", {
      get: function get() {
        return this.ctx.ignoreClearRect;
      },
      set: function set(value) {
        this.ctx.ignoreClearRect = Boolean(value);
      }
    });
  };

  Context2D.prototype.fill = function () {
    pathPreProcess.call(this, "fill", false);
  };
  /**
   * Actually draws the path you have defined
   *
   * @name stroke
   * @function
   * @description The stroke() method actually draws the path you have defined with all those moveTo() and lineTo() methods. The default color is black.
   */


  Context2D.prototype.stroke = function () {
    pathPreProcess.call(this, "stroke", false);
  };
  /**
   * Begins a path, or resets the current
   *
   * @name beginPath
   * @function
   * @description The beginPath() method begins a path, or resets the current path.
   */


  Context2D.prototype.beginPath = function () {
    this.path = [{
      type: "begin"
    }];
  };
  /**
   * Moves the path to the specified point in the canvas, without creating a line
   *
   * @name moveTo
   * @function
   * @param x {Number} The x-coordinate of where to move the path to
   * @param y {Number} The y-coordinate of where to move the path to
   */


  Context2D.prototype.moveTo = function (x, y) {
    if (isNaN(x) || isNaN(y)) {
      console.error("jsPDF.context2d.moveTo: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.moveTo");
    }

    var pt = this.ctx.transform.applyToPoint(new Point(x, y));
    this.path.push({
      type: "mt",
      x: pt.x,
      y: pt.y
    });
    this.ctx.lastPoint = new Point(x, y);
  };
  /**
   * Creates a path from the current point back to the starting point
   *
   * @name closePath
   * @function
   * @description The closePath() method creates a path from the current point back to the starting point.
   */


  Context2D.prototype.closePath = function () {
    var pathBegin = new Point(0, 0);
    var i = 0;

    for (i = this.path.length - 1; i !== -1; i--) {
      if (this.path[i].type === "begin") {
        if (_typeof(this.path[i + 1]) === "object" && typeof this.path[i + 1].x === "number") {
          pathBegin = new Point(this.path[i + 1].x, this.path[i + 1].y);
          this.path.push({
            type: "lt",
            x: pathBegin.x,
            y: pathBegin.y
          });
          break;
        }
      }
    }

    if (_typeof(this.path[i + 2]) === "object" && typeof this.path[i + 2].x === "number") {
      this.path.push(JSON.parse(JSON.stringify(this.path[i + 2])));
    }

    this.path.push({
      type: "close"
    });
    this.ctx.lastPoint = new Point(pathBegin.x, pathBegin.y);
  };
  /**
   * Adds a new point and creates a line to that point from the last specified point in the canvas
   *
   * @name lineTo
   * @function
   * @param x The x-coordinate of where to create the line to
   * @param y The y-coordinate of where to create the line to
   * @description The lineTo() method adds a new point and creates a line TO that point FROM the last specified point in the canvas (this method does not draw the line).
   */


  Context2D.prototype.lineTo = function (x, y) {
    if (isNaN(x) || isNaN(y)) {
      console.error("jsPDF.context2d.lineTo: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.lineTo");
    }

    var pt = this.ctx.transform.applyToPoint(new Point(x, y));
    this.path.push({
      type: "lt",
      x: pt.x,
      y: pt.y
    });
    this.ctx.lastPoint = new Point(pt.x, pt.y);
  };
  /**
   * Clips a region of any shape and size from the original canvas
   *
   * @name clip
   * @function
   * @description The clip() method clips a region of any shape and size from the original canvas.
   */


  Context2D.prototype.clip = function () {
    this.ctx.clip_path = JSON.parse(JSON.stringify(this.path));
    pathPreProcess.call(this, null, true);
  };
  /**
   * Creates a cubic Bézier curve
   *
   * @name quadraticCurveTo
   * @function
   * @param cpx {Number} The x-coordinate of the Bézier control point
   * @param cpy {Number} The y-coordinate of the Bézier control point
   * @param x {Number} The x-coordinate of the ending point
   * @param y {Number} The y-coordinate of the ending point
   * @description The quadraticCurveTo() method adds a point to the current path by using the specified control points that represent a quadratic Bézier curve.<br /><br /> A quadratic Bézier curve requires two points. The first point is a control point that is used in the quadratic Bézier calculation and the second point is the ending point for the curve. The starting point for the curve is the last point in the current path. If a path does not exist, use the beginPath() and moveTo() methods to define a starting point.
   */


  Context2D.prototype.quadraticCurveTo = function (cpx, cpy, x, y) {
    if (isNaN(x) || isNaN(y) || isNaN(cpx) || isNaN(cpy)) {
      console.error("jsPDF.context2d.quadraticCurveTo: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.quadraticCurveTo");
    }

    var pt0 = this.ctx.transform.applyToPoint(new Point(x, y));
    var pt1 = this.ctx.transform.applyToPoint(new Point(cpx, cpy));
    this.path.push({
      type: "qct",
      x1: pt1.x,
      y1: pt1.y,
      x: pt0.x,
      y: pt0.y
    });
    this.ctx.lastPoint = new Point(pt0.x, pt0.y);
  };
  /**
   * Creates a cubic Bézier curve
   *
   * @name bezierCurveTo
   * @function
   * @param cp1x {Number} The x-coordinate of the first Bézier control point
   * @param cp1y {Number} The y-coordinate of the first Bézier control point
   * @param cp2x {Number} The x-coordinate of the second Bézier control point
   * @param cp2y {Number} The y-coordinate of the second Bézier control point
   * @param x {Number} The x-coordinate of the ending point
   * @param y {Number} The y-coordinate of the ending point
   * @description The bezierCurveTo() method adds a point to the current path by using the specified control points that represent a cubic Bézier curve. <br /><br />A cubic bezier curve requires three points. The first two points are control points that are used in the cubic Bézier calculation and the last point is the ending point for the curve.  The starting point for the curve is the last point in the current path. If a path does not exist, use the beginPath() and moveTo() methods to define a starting point.
   */


  Context2D.prototype.bezierCurveTo = function (cp1x, cp1y, cp2x, cp2y, x, y) {
    if (isNaN(x) || isNaN(y) || isNaN(cp1x) || isNaN(cp1y) || isNaN(cp2x) || isNaN(cp2y)) {
      console.error("jsPDF.context2d.bezierCurveTo: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.bezierCurveTo");
    }

    var pt0 = this.ctx.transform.applyToPoint(new Point(x, y));
    var pt1 = this.ctx.transform.applyToPoint(new Point(cp1x, cp1y));
    var pt2 = this.ctx.transform.applyToPoint(new Point(cp2x, cp2y));
    this.path.push({
      type: "bct",
      x1: pt1.x,
      y1: pt1.y,
      x2: pt2.x,
      y2: pt2.y,
      x: pt0.x,
      y: pt0.y
    });
    this.ctx.lastPoint = new Point(pt0.x, pt0.y);
  };
  /**
   * Creates an arc/curve (used to create circles, or parts of circles)
   *
   * @name arc
   * @function
   * @param x {Number} The x-coordinate of the center of the circle
   * @param y {Number} The y-coordinate of the center of the circle
   * @param radius {Number} The radius of the circle
   * @param startAngle {Number} The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle)
   * @param endAngle {Number} The ending angle, in radians
   * @param counterclockwise {Boolean} Optional. Specifies whether the drawing should be counterclockwise or clockwise. False is default, and indicates clockwise, while true indicates counter-clockwise.
   * @description The arc() method creates an arc/curve (used to create circles, or parts of circles).
   */


  Context2D.prototype.arc = function (x, y, radius, startAngle, endAngle, counterclockwise) {
    if (isNaN(x) || isNaN(y) || isNaN(radius) || isNaN(startAngle) || isNaN(endAngle)) {
      console.error("jsPDF.context2d.arc: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.arc");
    }

    counterclockwise = Boolean(counterclockwise);

    if (!this.ctx.transform.isIdentity) {
      var xpt = this.ctx.transform.applyToPoint(new Point(x, y));
      x = xpt.x;
      y = xpt.y;
      var x_radPt = this.ctx.transform.applyToPoint(new Point(0, radius));
      var x_radPt0 = this.ctx.transform.applyToPoint(new Point(0, 0));
      radius = Math.sqrt(Math.pow(x_radPt.x - x_radPt0.x, 2) + Math.pow(x_radPt.y - x_radPt0.y, 2));
    }

    if (Math.abs(endAngle - startAngle) >= 2 * Math.PI) {
      startAngle = 0;
      endAngle = 2 * Math.PI;
    }

    this.path.push({
      type: "arc",
      x: x,
      y: y,
      radius: radius,
      startAngle: startAngle,
      endAngle: endAngle,
      counterclockwise: counterclockwise
    }); // this.ctx.lastPoint(new Point(pt.x,pt.y));
  };
  /**
   * Creates an arc/curve between two tangents
   *
   * @name arcTo
   * @function
   * @param x1 {Number} The x-coordinate of the first tangent
   * @param y1 {Number} The y-coordinate of the first tangent
   * @param x2 {Number} The x-coordinate of the second tangent
   * @param y2 {Number} The y-coordinate of the second tangent
   * @param radius The radius of the arc
   * @description The arcTo() method creates an arc/curve between two tangents on the canvas.
   */
  // eslint-disable-next-line no-unused-vars


  Context2D.prototype.arcTo = function (x1, y1, x2, y2, radius) {
    throw new Error("arcTo not implemented.");
  };
  /**
   * Creates a rectangle
   *
   * @name rect
   * @function
   * @param x {Number} The x-coordinate of the upper-left corner of the rectangle
   * @param y {Number} The y-coordinate of the upper-left corner of the rectangle
   * @param w {Number} The width of the rectangle, in pixels
   * @param h {Number} The height of the rectangle, in pixels
   * @description The rect() method creates a rectangle.
   */


  Context2D.prototype.rect = function (x, y, w, h) {
    if (isNaN(x) || isNaN(y) || isNaN(w) || isNaN(h)) {
      console.error("jsPDF.context2d.rect: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.rect");
    }

    this.moveTo(x, y);
    this.lineTo(x + w, y);
    this.lineTo(x + w, y + h);
    this.lineTo(x, y + h);
    this.lineTo(x, y);
    this.lineTo(x + w, y);
    this.lineTo(x, y);
  };
  /**
   * Draws a "filled" rectangle
   *
   * @name fillRect
   * @function
   * @param x {Number} The x-coordinate of the upper-left corner of the rectangle
   * @param y {Number} The y-coordinate of the upper-left corner of the rectangle
   * @param w {Number} The width of the rectangle, in pixels
   * @param h {Number} The height of the rectangle, in pixels
   * @description The fillRect() method draws a "filled" rectangle. The default color of the fill is black.
   */


  Context2D.prototype.fillRect = function (x, y, w, h) {
    if (isNaN(x) || isNaN(y) || isNaN(w) || isNaN(h)) {
      console.error("jsPDF.context2d.fillRect: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.fillRect");
    }

    if (isFillTransparent.call(this)) {
      return;
    }

    var tmp = {};

    if (this.lineCap !== "butt") {
      tmp.lineCap = this.lineCap;
      this.lineCap = "butt";
    }

    if (this.lineJoin !== "miter") {
      tmp.lineJoin = this.lineJoin;
      this.lineJoin = "miter";
    }

    this.beginPath();
    this.rect(x, y, w, h);
    this.fill();

    if (tmp.hasOwnProperty("lineCap")) {
      this.lineCap = tmp.lineCap;
    }

    if (tmp.hasOwnProperty("lineJoin")) {
      this.lineJoin = tmp.lineJoin;
    }
  };
  /**
   *     Draws a rectangle (no fill)
   *
   * @name strokeRect
   * @function
   * @param x {Number} The x-coordinate of the upper-left corner of the rectangle
   * @param y {Number} The y-coordinate of the upper-left corner of the rectangle
   * @param w {Number} The width of the rectangle, in pixels
   * @param h {Number} The height of the rectangle, in pixels
   * @description The strokeRect() method draws a rectangle (no fill). The default color of the stroke is black.
   */


  Context2D.prototype.strokeRect = function strokeRect(x, y, w, h) {
    if (isNaN(x) || isNaN(y) || isNaN(w) || isNaN(h)) {
      console.error("jsPDF.context2d.strokeRect: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.strokeRect");
    }

    if (isStrokeTransparent.call(this)) {
      return;
    }

    this.beginPath();
    this.rect(x, y, w, h);
    this.stroke();
  };
  /**
   * Clears the specified pixels within a given rectangle
   *
   * @name clearRect
   * @function
   * @param x {Number} The x-coordinate of the upper-left corner of the rectangle
   * @param y {Number} The y-coordinate of the upper-left corner of the rectangle
   * @param w {Number} The width of the rectangle to clear, in pixels
   * @param h {Number} The height of the rectangle to clear, in pixels
   * @description We cannot clear PDF commands that were already written to PDF, so we use white instead. <br />
   * As a special case, read a special flag (ignoreClearRect) and do nothing if it is set.
   * This results in all calls to clearRect() to do nothing, and keep the canvas transparent.
   * This flag is stored in the save/restore context and is managed the same way as other drawing states.
   *
   */


  Context2D.prototype.clearRect = function (x, y, w, h) {
    if (isNaN(x) || isNaN(y) || isNaN(w) || isNaN(h)) {
      console.error("jsPDF.context2d.clearRect: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.clearRect");
    }

    if (this.ignoreClearRect) {
      return;
    }

    this.fillStyle = "#ffffff";
    this.fillRect(x, y, w, h);
  };
  /**
   * Saves the state of the current context
   *
   * @name save
   * @function
   */


  Context2D.prototype.save = function (doStackPush) {
    doStackPush = typeof doStackPush === "boolean" ? doStackPush : true;
    var tmpPageNumber = this.pdf.internal.getCurrentPageInfo().pageNumber;

    for (var i = 0; i < this.pdf.internal.getNumberOfPages(); i++) {
      this.pdf.setPage(i + 1);
      this.pdf.internal.out("q");
    }

    this.pdf.setPage(tmpPageNumber);

    if (doStackPush) {
      this.ctx.fontSize = this.pdf.internal.getFontSize();
      var ctx = new ContextLayer(this.ctx);
      this.ctxStack.push(this.ctx);
      this.ctx = ctx;
    }
  };
  /**
   * Returns previously saved path state and attributes
   *
   * @name restore
   * @function
   */


  Context2D.prototype.restore = function (doStackPop) {
    doStackPop = typeof doStackPop === "boolean" ? doStackPop : true;
    var tmpPageNumber = this.pdf.internal.getCurrentPageInfo().pageNumber;

    for (var i = 0; i < this.pdf.internal.getNumberOfPages(); i++) {
      this.pdf.setPage(i + 1);
      this.pdf.internal.out("Q");
    }

    this.pdf.setPage(tmpPageNumber);

    if (doStackPop && this.ctxStack.length !== 0) {
      this.ctx = this.ctxStack.pop();
      this.fillStyle = this.ctx.fillStyle;
      this.strokeStyle = this.ctx.strokeStyle;
      this.font = this.ctx.font;
      this.lineCap = this.ctx.lineCap;
      this.lineWidth = this.ctx.lineWidth;
      this.lineJoin = this.ctx.lineJoin;
    }
  };
  /**
   * @name toDataURL
   * @function
   */


  Context2D.prototype.toDataURL = function () {
    throw new Error("toDataUrl not implemented.");
  }; //helper functions

  /**
   * Get the decimal values of r, g, b and a
   *
   * @name getRGBA
   * @function
   * @private
   * @ignore
   */


  var getRGBA = function getRGBA(style) {
    var rxRgb = /rgb\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/;
    var rxRgba = /rgba\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*([\d.]+)\s*\)/;
    var rxTransparent = /transparent|rgba\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*0+\s*\)/;
    var r, g, b, a;

    if (style.isCanvasGradient === true) {
      style = style.getColor();
    }

    if (!style) {
      return {
        r: 0,
        g: 0,
        b: 0,
        a: 0,
        style: style
      };
    }

    if (rxTransparent.test(style)) {
      r = 0;
      g = 0;
      b = 0;
      a = 0;
    } else {
      var matches = rxRgb.exec(style);

      if (matches !== null) {
        r = parseInt(matches[1]);
        g = parseInt(matches[2]);
        b = parseInt(matches[3]);
        a = 1;
      } else {
        matches = rxRgba.exec(style);

        if (matches !== null) {
          r = parseInt(matches[1]);
          g = parseInt(matches[2]);
          b = parseInt(matches[3]);
          a = parseFloat(matches[4]);
        } else {
          a = 1;

          if (typeof style === "string" && style.charAt(0) !== "#") {
            var rgbColor = new RGBColor(style);

            if (rgbColor.ok) {
              style = rgbColor.toHex();
            } else {
              style = "#000000";
            }
          }

          if (style.length === 4) {
            r = style.substring(1, 2);
            r += r;
            g = style.substring(2, 3);
            g += g;
            b = style.substring(3, 4);
            b += b;
          } else {
            r = style.substring(1, 3);
            g = style.substring(3, 5);
            b = style.substring(5, 7);
          }

          r = parseInt(r, 16);
          g = parseInt(g, 16);
          b = parseInt(b, 16);
        }
      }
    }

    return {
      r: r,
      g: g,
      b: b,
      a: a,
      style: style
    };
  };
  /**
   * @name isFillTransparent
   * @function
   * @private
   * @ignore
   * @returns {Boolean}
   */


  var isFillTransparent = function isFillTransparent() {
    return this.ctx.isFillTransparent || this.globalAlpha == 0;
  };
  /**
   * @name isStrokeTransparent
   * @function
   * @private
   * @ignore
   * @returns {Boolean}
   */


  var isStrokeTransparent = function isStrokeTransparent() {
    return Boolean(this.ctx.isStrokeTransparent || this.globalAlpha == 0);
  };
  /**
   * Draws "filled" text on the canvas
   *
   * @name fillText
   * @function
   * @param text {String} Specifies the text that will be written on the canvas
   * @param x {Number} The x coordinate where to start painting the text (relative to the canvas)
   * @param y {Number} The y coordinate where to start painting the text (relative to the canvas)
   * @param maxWidth {Number} Optional. The maximum allowed width of the text, in pixels
   * @description The fillText() method draws filled text on the canvas. The default color of the text is black.
   */


  Context2D.prototype.fillText = function (text, x, y, maxWidth) {
    if (isNaN(x) || isNaN(y) || typeof text !== "string") {
      console.error("jsPDF.context2d.fillText: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.fillText");
    }

    maxWidth = isNaN(maxWidth) ? undefined : maxWidth;

    if (isFillTransparent.call(this)) {
      return;
    }

    y = getBaseline.call(this, y);
    var degs = rad2deg(this.ctx.transform.rotation); // We only use X axis as scale hint

    var scale = this.ctx.transform.scaleX;
    putText.call(this, {
      text: text,
      x: x,
      y: y,
      scale: scale,
      angle: degs,
      align: this.textAlign,
      maxWidth: maxWidth
    });
  };
  /**
   * Draws text on the canvas (no fill)
   *
   * @name strokeText
   * @function
   * @param text {String} Specifies the text that will be written on the canvas
   * @param x {Number} The x coordinate where to start painting the text (relative to the canvas)
   * @param y {Number} The y coordinate where to start painting the text (relative to the canvas)
   * @param maxWidth {Number} Optional. The maximum allowed width of the text, in pixels
   * @description The strokeText() method draws text (with no fill) on the canvas. The default color of the text is black.
   */


  Context2D.prototype.strokeText = function (text, x, y, maxWidth) {
    if (isNaN(x) || isNaN(y) || typeof text !== "string") {
      console.error("jsPDF.context2d.strokeText: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.strokeText");
    }

    if (isStrokeTransparent.call(this)) {
      return;
    }

    maxWidth = isNaN(maxWidth) ? undefined : maxWidth;
    y = getBaseline.call(this, y);
    var degs = rad2deg(this.ctx.transform.rotation);
    var scale = this.ctx.transform.scaleX;
    putText.call(this, {
      text: text,
      x: x,
      y: y,
      scale: scale,
      renderingMode: "stroke",
      angle: degs,
      align: this.textAlign,
      maxWidth: maxWidth
    });
  };
  /**
   * Returns an object that contains the width of the specified text
   *
   * @name measureText
   * @function
   * @param text {String} The text to be measured
   * @description The measureText() method returns an object that contains the width of the specified text, in pixels.
   * @returns {Number}
   */


  Context2D.prototype.measureText = function (text) {
    if (typeof text !== "string") {
      console.error("jsPDF.context2d.measureText: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.measureText");
    }

    var pdf = this.pdf;
    var k = this.pdf.internal.scaleFactor;
    var fontSize = pdf.internal.getFontSize();
    var txtWidth = pdf.getStringUnitWidth(text) * fontSize / pdf.internal.scaleFactor;
    txtWidth *= Math.round(k * 96 / 72 * 10000) / 10000;

    var TextMetrics = function TextMetrics(options) {
      options = options || {};

      var _width = options.width || 0;

      Object.defineProperty(this, "width", {
        get: function get() {
          return _width;
        }
      });
      return this;
    };

    return new TextMetrics({
      width: txtWidth
    });
  }; //Transformations

  /**
   * Scales the current drawing bigger or smaller
   *
   * @name scale
   * @function
   * @param scalewidth {Number} Scales the width of the current drawing (1=100%, 0.5=50%, 2=200%, etc.)
   * @param scaleheight {Number} Scales the height of the current drawing (1=100%, 0.5=50%, 2=200%, etc.)
   * @description The scale() method scales the current drawing, bigger or smaller.
   */


  Context2D.prototype.scale = function (scalewidth, scaleheight) {
    if (isNaN(scalewidth) || isNaN(scaleheight)) {
      console.error("jsPDF.context2d.scale: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.scale");
    }

    var matrix = new Matrix(scalewidth, 0.0, 0.0, scaleheight, 0.0, 0.0);
    this.ctx.transform = this.ctx.transform.multiply(matrix);
  };
  /**
   * Rotates the current drawing
   *
   * @name rotate
   * @function
   * @param angle {Number} The rotation angle, in radians.
   * @description To calculate from degrees to radians: degrees*Math.PI/180. <br />
   * Example: to rotate 5 degrees, specify the following: 5*Math.PI/180
   */


  Context2D.prototype.rotate = function (angle) {
    if (isNaN(angle)) {
      console.error("jsPDF.context2d.rotate: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.rotate");
    }

    var matrix = new Matrix(Math.cos(angle), Math.sin(angle), -Math.sin(angle), Math.cos(angle), 0.0, 0.0);
    this.ctx.transform = this.ctx.transform.multiply(matrix);
  };
  /**
   * Remaps the (0,0) position on the canvas
   *
   * @name translate
   * @function
   * @param x {Number} The value to add to horizontal (x) coordinates
   * @param y {Number} The value to add to vertical (y) coordinates
   * @description The translate() method remaps the (0,0) position on the canvas.
   */


  Context2D.prototype.translate = function (x, y) {
    if (isNaN(x) || isNaN(y)) {
      console.error("jsPDF.context2d.translate: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.translate");
    }

    var matrix = new Matrix(1.0, 0.0, 0.0, 1.0, x, y);
    this.ctx.transform = this.ctx.transform.multiply(matrix);
  };
  /**
   * Replaces the current transformation matrix for the drawing
   *
   * @name transform
   * @function
   * @param a {Number} Horizontal scaling
   * @param b {Number} Horizontal skewing
   * @param c {Number} Vertical skewing
   * @param d {Number} Vertical scaling
   * @param e {Number} Horizontal moving
   * @param f {Number} Vertical moving
   * @description Each object on the canvas has a current transformation matrix.<br /><br />The transform() method replaces the current transformation matrix. It multiplies the current transformation matrix with the matrix described by:<br /><br /><br /><br />a    c    e<br /><br />b    d    f<br /><br />0    0    1<br /><br />In other words, the transform() method lets you scale, rotate, move, and skew the current context.
   */


  Context2D.prototype.transform = function (a, b, c, d, e, f) {
    if (isNaN(a) || isNaN(b) || isNaN(c) || isNaN(d) || isNaN(e) || isNaN(f)) {
      console.error("jsPDF.context2d.transform: Invalid arguments", arguments);
      throw new Error("Invalid arguments passed to jsPDF.context2d.transform");
    }

    var matrix = new Matrix(a, b, c, d, e, f);
    this.ctx.transform = this.ctx.transform.multiply(matrix);
  };
  /**
   * Resets the current transform to the identity matrix. Then runs transform()
   *
   * @name setTransform
   * @function
   * @param a {Number} Horizontal scaling
   * @param b {Number} Horizontal skewing
   * @param c {Number} Vertical skewing
   * @param d {Number} Vertical scaling
   * @param e {Number} Horizontal moving
   * @param f {Number} Vertical moving
   * @description Each object on the canvas has a current transformation matrix. <br /><br />The setTransform() method resets the current transform to the identity matrix, and then runs transform() with the same arguments.<br /><br />In other words, the setTransform() method lets you scale, rotate, move, and skew the current context.
   */


  Context2D.prototype.setTransform = function (a, b, c, d, e, f) {
    a = isNaN(a) ? 1 : a;
    b = isNaN(b) ? 0 : b;
    c = isNaN(c) ? 0 : c;
    d = isNaN(d) ? 1 : d;
    e = isNaN(e) ? 0 : e;
    f = isNaN(f) ? 0 : f;
    this.ctx.transform = new Matrix(a, b, c, d, e, f);
  };
  /**
   * Draws an image, canvas, or video onto the canvas
   *
   * @function
   * @param img {} Specifies the image, canvas, or video element to use
   * @param sx {Number} Optional. The x coordinate where to start clipping
   * @param sy {Number} Optional. The y coordinate where to start clipping
   * @param swidth {Number} Optional. The width of the clipped image
   * @param sheight {Number} Optional. The height of the clipped image
   * @param x {Number} The x coordinate where to place the image on the canvas
   * @param y {Number} The y coordinate where to place the image on the canvas
   * @param width {Number} Optional. The width of the image to use (stretch or reduce the image)
   * @param height {Number} Optional. The height of the image to use (stretch or reduce the image)
   */


  Context2D.prototype.drawImage = function (img, sx, sy, swidth, sheight, x, y, width, height) {
    var imageProperties = this.pdf.getImageProperties(img);
    var factorX = 1;
    var factorY = 1;
    var clipFactorX = 1;
    var clipFactorY = 1;

    if (typeof swidth !== "undefined" && typeof width !== "undefined") {
      clipFactorX = width / swidth;
      clipFactorY = height / sheight;
      factorX = imageProperties.width / swidth * width / swidth;
      factorY = imageProperties.height / sheight * height / sheight;
    } //is sx and sy are set and x and y not, set x and y with values of sx and sy


    if (typeof x === "undefined") {
      x = sx;
      y = sy;
      sx = 0;
      sy = 0;
    }

    if (typeof swidth !== "undefined" && typeof width === "undefined") {
      width = swidth;
      height = sheight;
    }

    if (typeof swidth === "undefined" && typeof width === "undefined") {
      width = imageProperties.width;
      height = imageProperties.height;
    }

    var decomposedTransformationMatrix = this.ctx.transform.decompose();
    var angle = rad2deg(decomposedTransformationMatrix.rotate.shx);
    var matrix = new Matrix();
    matrix = matrix.multiply(decomposedTransformationMatrix.translate);
    matrix = matrix.multiply(decomposedTransformationMatrix.skew);
    matrix = matrix.multiply(decomposedTransformationMatrix.scale);
    var xRect = matrix.applyToRectangle(new Rectangle(x - sx * clipFactorX, y - sy * clipFactorY, swidth * factorX, sheight * factorY));
    var pageArray = getPagesByPath.call(this, xRect);
    var pages = [];

    for (var ii = 0; ii < pageArray.length; ii += 1) {
      if (pages.indexOf(pageArray[ii]) === -1) {
        pages.push(pageArray[ii]);
      }
    }

    pages.sort();
    var clipPath;

    if (this.autoPaging) {
      var min = pages[0];
      var max = pages[pages.length - 1];

      for (var i = min; i < max + 1; i++) {
        this.pdf.setPage(i);

        if (this.ctx.clip_path.length !== 0) {
          var tmpPaths = this.path;
          clipPath = JSON.parse(JSON.stringify(this.ctx.clip_path));
          this.path = pathPositionRedo(clipPath, this.posX, -1 * this.pdf.internal.pageSize.height * (i - 1) + this.posY);
          drawPaths.call(this, "fill", true);
          this.path = tmpPaths;
        }

        var tmpRect = JSON.parse(JSON.stringify(xRect));
        tmpRect = pathPositionRedo([tmpRect], this.posX, -1 * this.pdf.internal.pageSize.height * (i - 1) + this.posY)[0];
        this.pdf.addImage(img, "JPEG", tmpRect.x, tmpRect.y, tmpRect.w, tmpRect.h, null, null, angle);
      }
    } else {
      this.pdf.addImage(img, "JPEG", xRect.x, xRect.y, xRect.w, xRect.h, null, null, angle);
    }
  };

  var getPagesByPath = function getPagesByPath(path, pageWrapX, pageWrapY) {
    var result = [];
    pageWrapX = pageWrapX || this.pdf.internal.pageSize.width;
    pageWrapY = pageWrapY || this.pdf.internal.pageSize.height;

    switch (path.type) {
      default:
      case "mt":
      case "lt":
        result.push(Math.floor((path.y + this.posY) / pageWrapY) + 1);
        break;

      case "arc":
        result.push(Math.floor((path.y + this.posY - path.radius) / pageWrapY) + 1);
        result.push(Math.floor((path.y + this.posY + path.radius) / pageWrapY) + 1);
        break;

      case "qct":
        var rectOfQuadraticCurve = getQuadraticCurveBoundary(this.ctx.lastPoint.x, this.ctx.lastPoint.y, path.x1, path.y1, path.x, path.y);
        result.push(Math.floor(rectOfQuadraticCurve.y / pageWrapY) + 1);
        result.push(Math.floor((rectOfQuadraticCurve.y + rectOfQuadraticCurve.h) / pageWrapY) + 1);
        break;

      case "bct":
        var rectOfBezierCurve = getBezierCurveBoundary(this.ctx.lastPoint.x, this.ctx.lastPoint.y, path.x1, path.y1, path.x2, path.y2, path.x, path.y);
        result.push(Math.floor(rectOfBezierCurve.y / pageWrapY) + 1);
        result.push(Math.floor((rectOfBezierCurve.y + rectOfBezierCurve.h) / pageWrapY) + 1);
        break;

      case "rect":
        result.push(Math.floor((path.y + this.posY) / pageWrapY) + 1);
        result.push(Math.floor((path.y + path.h + this.posY) / pageWrapY) + 1);
    }

    for (var i = 0; i < result.length; i += 1) {
      while (this.pdf.internal.getNumberOfPages() < result[i]) {
        addPage.call(this);
      }
    }

    return result;
  };

  var addPage = function addPage() {
    var fillStyle = this.fillStyle;
    var strokeStyle = this.strokeStyle;
    var font = this.font;
    var lineCap = this.lineCap;
    var lineWidth = this.lineWidth;
    var lineJoin = this.lineJoin;
    this.pdf.addPage();
    this.fillStyle = fillStyle;
    this.strokeStyle = strokeStyle;
    this.font = font;
    this.lineCap = lineCap;
    this.lineWidth = lineWidth;
    this.lineJoin = lineJoin;
  };

  var pathPositionRedo = function pathPositionRedo(paths, x, y) {
    for (var i = 0; i < paths.length; i++) {
      switch (paths[i].type) {
        case "bct":
          paths[i].x2 += x;
          paths[i].y2 += y;

        case "qct":
          paths[i].x1 += x;
          paths[i].y1 += y;

        case "mt":
        case "lt":
        case "arc":
        default:
          paths[i].x += x;
          paths[i].y += y;
      }
    }

    return paths;
  };

  var pathPreProcess = function pathPreProcess(rule, isClip) {
    var fillStyle = this.fillStyle;
    var strokeStyle = this.strokeStyle;
    var lineCap = this.lineCap;
    var lineWidth = this.lineWidth;
    var lineJoin = this.lineJoin;
    var origPath = JSON.parse(JSON.stringify(this.path));
    var xPath = JSON.parse(JSON.stringify(this.path));
    var clipPath;
    var tmpPath;
    var pages = [];

    for (var i = 0; i < xPath.length; i++) {
      if (typeof xPath[i].x !== "undefined") {
        var page = getPagesByPath.call(this, xPath[i]);

        for (var ii = 0; ii < page.length; ii += 1) {
          if (pages.indexOf(page[ii]) === -1) {
            pages.push(page[ii]);
          }
        }
      }
    }

    for (var j = 0; j < pages.length; j++) {
      while (this.pdf.internal.getNumberOfPages() < pages[j]) {
        addPage.call(this);
      }
    }

    pages.sort();

    if (this.autoPaging) {
      var min = pages[0];
      var max = pages[pages.length - 1];

      for (var k = min; k < max + 1; k++) {
        this.pdf.setPage(k);
        this.fillStyle = fillStyle;
        this.strokeStyle = strokeStyle;
        this.lineCap = lineCap;
        this.lineWidth = lineWidth;
        this.lineJoin = lineJoin;

        if (this.ctx.clip_path.length !== 0) {
          var tmpPaths = this.path;
          clipPath = JSON.parse(JSON.stringify(this.ctx.clip_path));
          this.path = pathPositionRedo(clipPath, this.posX, -1 * this.pdf.internal.pageSize.height * (k - 1) + this.posY);
          drawPaths.call(this, rule, true);
          this.path = tmpPaths;
        }

        tmpPath = JSON.parse(JSON.stringify(origPath));
        this.path = pathPositionRedo(tmpPath, this.posX, -1 * this.pdf.internal.pageSize.height * (k - 1) + this.posY);

        if (isClip === false || k === 0) {
          drawPaths.call(this, rule, isClip);
        }
      }
    } else {
      drawPaths.call(this, rule, isClip);
    }

    this.path = origPath;
  };
  /**
   * Processes the paths
   *
   * @function
   * @param rule {String}
   * @param isClip {Boolean}
   * @private
   * @ignore
   */


  var drawPaths = function drawPaths(rule, isClip) {
    if (rule === "stroke" && !isClip && isStrokeTransparent.call(this)) {
      return;
    }

    if (rule !== "stroke" && !isClip && isFillTransparent.call(this)) {
      return;
    }

    var moves = []; //var alpha = (this.ctx.fillOpacity < 1) ? this.ctx.fillOpacity : this.ctx.globalAlpha;

    var delta;
    var xPath = this.path;

    for (var i = 0; i < xPath.length; i++) {
      var pt = xPath[i];

      switch (pt.type) {
        case "begin":
          moves.push({
            begin: true
          });
          break;

        case "close":
          moves.push({
            close: true
          });
          break;

        case "mt":
          moves.push({
            start: pt,
            deltas: [],
            abs: []
          });
          break;

        case "lt":
          var iii = moves.length;

          if (!isNaN(xPath[i - 1].x)) {
            delta = [pt.x - xPath[i - 1].x, pt.y - xPath[i - 1].y];

            if (iii > 0) {
              for (iii; iii >= 0; iii--) {
                if (moves[iii - 1].close !== true && moves[iii - 1].begin !== true) {
                  moves[iii - 1].deltas.push(delta);
                  moves[iii - 1].abs.push(pt);
                  break;
                }
              }
            }
          }

          break;

        case "bct":
          delta = [pt.x1 - xPath[i - 1].x, pt.y1 - xPath[i - 1].y, pt.x2 - xPath[i - 1].x, pt.y2 - xPath[i - 1].y, pt.x - xPath[i - 1].x, pt.y - xPath[i - 1].y];
          moves[moves.length - 1].deltas.push(delta);
          break;

        case "qct":
          var x1 = xPath[i - 1].x + 2.0 / 3.0 * (pt.x1 - xPath[i - 1].x);
          var y1 = xPath[i - 1].y + 2.0 / 3.0 * (pt.y1 - xPath[i - 1].y);
          var x2 = pt.x + 2.0 / 3.0 * (pt.x1 - pt.x);
          var y2 = pt.y + 2.0 / 3.0 * (pt.y1 - pt.y);
          var x3 = pt.x;
          var y3 = pt.y;
          delta = [x1 - xPath[i - 1].x, y1 - xPath[i - 1].y, x2 - xPath[i - 1].x, y2 - xPath[i - 1].y, x3 - xPath[i - 1].x, y3 - xPath[i - 1].y];
          moves[moves.length - 1].deltas.push(delta);
          break;

        case "arc":
          moves.push({
            deltas: [],
            abs: [],
            arc: true
          });

          if (Array.isArray(moves[moves.length - 1].abs)) {
            moves[moves.length - 1].abs.push(pt);
          }

          break;
      }
    }

    var style;

    if (!isClip) {
      if (rule === "stroke") {
        style = "stroke";
      } else {
        style = "fill";
      }
    } else {
      style = null;
    }

    for (var k = 0; k < moves.length; k++) {
      if (moves[k].arc) {
        var arcs = moves[k].abs;

        for (var ii = 0; ii < arcs.length; ii++) {
          var arc = arcs[ii];

          if (arc.type === "arc") {
            drawArc.call(this, arc.x, arc.y, arc.radius, arc.startAngle, arc.endAngle, arc.counterclockwise, undefined, isClip);
          } else {
            drawLine.call(this, arc.x, arc.y);
          }
        }

        putStyle.call(this, style);
        this.pdf.internal.out("h");
      }

      if (!moves[k].arc) {
        if (moves[k].close !== true && moves[k].begin !== true) {
          var x = moves[k].start.x;
          var y = moves[k].start.y;
          drawLines.call(this, moves[k].deltas, x, y);
        }
      }
    }

    if (style) {
      putStyle.call(this, style);
    }

    if (isClip) {
      doClip.call(this);
    }
  };

  var getBaseline = function getBaseline(y) {
    var height = this.pdf.internal.getFontSize() / this.pdf.internal.scaleFactor;
    var descent = height * (this.pdf.internal.getLineHeightFactor() - 1);

    switch (this.ctx.textBaseline) {
      case "bottom":
        return y - descent;

      case "top":
        return y + height - descent;

      case "hanging":
        return y + height - 2 * descent;

      case "middle":
        return y + height / 2 - descent;

      case "ideographic":
        // TODO not implemented
        return y;

      case "alphabetic":
      default:
        return y;
    }
  };

  Context2D.prototype.createLinearGradient = function createLinearGradient() {
    var canvasGradient = function canvasGradient() {};

    canvasGradient.colorStops = [];

    canvasGradient.addColorStop = function (offset, color) {
      this.colorStops.push([offset, color]);
    };

    canvasGradient.getColor = function () {
      if (this.colorStops.length === 0) {
        return "#000000";
      }

      return this.colorStops[0][1];
    };

    canvasGradient.isCanvasGradient = true;
    return canvasGradient;
  };

  Context2D.prototype.createPattern = function createPattern() {
    return this.createLinearGradient();
  };

  Context2D.prototype.createRadialGradient = function createRadialGradient() {
    return this.createLinearGradient();
  };
  /**
   *
   * @param x Edge point X
   * @param y Edge point Y
   * @param r Radius
   * @param a1 start angle
   * @param a2 end angle
   * @param counterclockwise
   * @param style
   * @param isClip
   */


  var drawArc = function drawArc(x, y, r, a1, a2, counterclockwise, style, isClip) {
    var curves = createArc.call(this, r, a1, a2, counterclockwise);

    for (var i = 0; i < curves.length; i++) {
      var curve = curves[i];

      if (i === 0) {
        doMove.call(this, curve.x1 + x, curve.y1 + y);
      }

      drawCurve.call(this, x, y, curve.x2, curve.y2, curve.x3, curve.y3, curve.x4, curve.y4);
    }

    if (!isClip) {
      putStyle.call(this, style);
    } else {
      doClip.call(this);
    }
  };

  var putStyle = function putStyle(style) {
    switch (style) {
      case "stroke":
        this.pdf.internal.out("S");
        break;

      case "fill":
        this.pdf.internal.out("f");
        break;
    }
  };

  var doClip = function doClip() {
    this.pdf.clip();
    this.pdf.discardPath();
  };

  var doMove = function doMove(x, y) {
    this.pdf.internal.out(getHorizontalCoordinateString(x) + " " + getVerticalCoordinateString(y) + " m");
  };

  var putText = function putText(options) {
    var textAlign;

    switch (options.align) {
      case "right":
      case "end":
        textAlign = "right";
        break;

      case "center":
        textAlign = "center";
        break;

      case "left":
      case "start":
      default:
        textAlign = "left";
        break;
    }

    var pt = this.ctx.transform.applyToPoint(new Point(options.x, options.y));
    var decomposedTransformationMatrix = this.ctx.transform.decompose();
    var matrix = new Matrix();
    matrix = matrix.multiply(decomposedTransformationMatrix.translate);
    matrix = matrix.multiply(decomposedTransformationMatrix.skew);
    matrix = matrix.multiply(decomposedTransformationMatrix.scale);
    var textDimensions = this.pdf.getTextDimensions(options.text);
    var textRect = this.ctx.transform.applyToRectangle(new Rectangle(options.x, options.y, textDimensions.w, textDimensions.h));
    var textXRect = matrix.applyToRectangle(new Rectangle(options.x, options.y - textDimensions.h, textDimensions.w, textDimensions.h));
    var pageArray = getPagesByPath.call(this, textXRect);
    var pages = [];

    for (var ii = 0; ii < pageArray.length; ii += 1) {
      if (pages.indexOf(pageArray[ii]) === -1) {
        pages.push(pageArray[ii]);
      }
    }

    pages.sort();
    var clipPath, oldSize;

    if (this.autoPaging === true) {
      var min = pages[0];
      var max = pages[pages.length - 1];

      for (var i = min; i < max + 1; i++) {
        this.pdf.setPage(i);

        if (this.ctx.clip_path.length !== 0) {
          var tmpPaths = this.path;
          clipPath = JSON.parse(JSON.stringify(this.ctx.clip_path));
          this.path = pathPositionRedo(clipPath, this.posX, -1 * this.pdf.internal.pageSize.height * (i - 1) + this.posY);
          drawPaths.call(this, "fill", true);
          this.path = tmpPaths;
        }

        var tmpRect = JSON.parse(JSON.stringify(textRect));
        tmpRect = pathPositionRedo([tmpRect], this.posX, -1 * this.pdf.internal.pageSize.height * (i - 1) + this.posY)[0];

        if (options.scale >= 0.01) {
          oldSize = this.pdf.internal.getFontSize();
          this.pdf.setFontSize(oldSize * options.scale);
        }

        this.pdf.text(options.text, tmpRect.x, tmpRect.y, {
          angle: options.angle,
          align: textAlign,
          renderingMode: options.renderingMode,
          maxWidth: options.maxWidth
        });

        if (options.scale >= 0.01) {
          this.pdf.setFontSize(oldSize);
        }
      }
    } else {
      if (options.scale >= 0.01) {
        oldSize = this.pdf.internal.getFontSize();
        this.pdf.setFontSize(oldSize * options.scale);
      }

      this.pdf.text(options.text, pt.x + this.posX, pt.y + this.posY, {
        angle: options.angle,
        align: textAlign,
        renderingMode: options.renderingMode,
        maxWidth: options.maxWidth
      });

      if (options.scale >= 0.01) {
        this.pdf.setFontSize(oldSize);
      }
    }
  };

  var drawLine = function drawLine(x, y, prevX, prevY) {
    prevX = prevX || 0;
    prevY = prevY || 0;
    this.pdf.internal.out(getHorizontalCoordinateString(x + prevX) + " " + getVerticalCoordinateString(y + prevY) + " l");
  };

  var drawLines = function drawLines(lines, x, y) {
    return this.pdf.lines(lines, x, y, null, null);
  };

  var drawCurve = function drawCurve(x, y, x1, y1, x2, y2, x3, y3) {
    this.pdf.internal.out([f2(getHorizontalCoordinate(x1 + x)), f2(getVerticalCoordinate(y1 + y)), f2(getHorizontalCoordinate(x2 + x)), f2(getVerticalCoordinate(y2 + y)), f2(getHorizontalCoordinate(x3 + x)), f2(getVerticalCoordinate(y3 + y)), "c"].join(" "));
  };
  /**
   * Return a array of objects that represent bezier curves which approximate the circular arc centered at the origin, from startAngle to endAngle (radians) with the specified radius.
   *
   * Each bezier curve is an object with four points, where x1,y1 and x4,y4 are the arc's end points and x2,y2 and x3,y3 are the cubic bezier's control points.
   * @function createArc
   */


  var createArc = function createArc(radius, startAngle, endAngle, anticlockwise) {
    var EPSILON = 0.00001; // Roughly 1/1000th of a degree, see below

    var twoPi = Math.PI * 2;
    var halfPi = Math.PI / 2.0;

    while (startAngle > endAngle) {
      startAngle = startAngle - twoPi;
    }

    var totalAngle = Math.abs(endAngle - startAngle);

    if (totalAngle < twoPi) {
      if (anticlockwise) {
        totalAngle = twoPi - totalAngle;
      }
    } // Compute the sequence of arc curves, up to PI/2 at a time.


    var curves = []; // clockwise or counterclockwise

    var sgn = anticlockwise ? -1 : +1;
    var a1 = startAngle;

    for (; totalAngle > EPSILON;) {
      var remain = sgn * Math.min(totalAngle, halfPi);
      var a2 = a1 + remain;
      curves.push(createSmallArc.call(this, radius, a1, a2));
      totalAngle -= Math.abs(a2 - a1);
      a1 = a2;
    }

    return curves;
  };
  /**
   * Cubic bezier approximation of a circular arc centered at the origin, from (radians) a1 to a2, where a2-a1 < pi/2. The arc's radius is r.
   *
   * Returns an object with four points, where x1,y1 and x4,y4 are the arc's end points and x2,y2 and x3,y3 are the cubic bezier's control points.
   *
   * This algorithm is based on the approach described in: A. Riškus, "Approximation of a Cubic Bezier Curve by Circular Arcs and Vice Versa," Information Technology and Control, 35(4), 2006 pp. 371-378.
   */


  var createSmallArc = function createSmallArc(r, a1, a2) {
    var a = (a2 - a1) / 2.0;
    var x4 = r * Math.cos(a);
    var y4 = r * Math.sin(a);
    var x1 = x4;
    var y1 = -y4;
    var q1 = x1 * x1 + y1 * y1;
    var q2 = q1 + x1 * x4 + y1 * y4;
    var k2 = 4 / 3 * (Math.sqrt(2 * q1 * q2) - q2) / (x1 * y4 - y1 * x4);
    var x2 = x1 - k2 * y1;
    var y2 = y1 + k2 * x1;
    var x3 = x2;
    var y3 = -y2;
    var ar = a + a1;
    var cos_ar = Math.cos(ar);
    var sin_ar = Math.sin(ar);
    return {
      x1: r * Math.cos(a1),
      y1: r * Math.sin(a1),
      x2: x2 * cos_ar - y2 * sin_ar,
      y2: x2 * sin_ar + y2 * cos_ar,
      x3: x3 * cos_ar - y3 * sin_ar,
      y3: x3 * sin_ar + y3 * cos_ar,
      x4: r * Math.cos(a2),
      y4: r * Math.sin(a2)
    };
  };

  var rad2deg = function rad2deg(value) {
    return value * 180 / Math.PI;
  };

  var getQuadraticCurveBoundary = function getQuadraticCurveBoundary(sx, sy, cpx, cpy, ex, ey) {
    var midX1 = sx + (cpx - sx) * 0.5;
    var midY1 = sy + (cpy - sy) * 0.5;
    var midX2 = ex + (cpx - ex) * 0.5;
    var midY2 = ey + (cpy - ey) * 0.5;
    var resultX1 = Math.min(sx, ex, midX1, midX2);
    var resultX2 = Math.max(sx, ex, midX1, midX2);
    var resultY1 = Math.min(sy, ey, midY1, midY2);
    var resultY2 = Math.max(sy, ey, midY1, midY2);
    return new Rectangle(resultX1, resultY1, resultX2 - resultX1, resultY2 - resultY1);
  }; //De Casteljau algorithm


  var getBezierCurveBoundary = function getBezierCurveBoundary(ax, ay, bx, by, cx, cy, dx, dy) {
    var tobx = bx - ax;
    var toby = by - ay;
    var tocx = cx - bx;
    var tocy = cy - by;
    var todx = dx - cx;
    var tody = dy - cy;
    var precision = 40;
    var d, i, px, py, qx, qy, rx, ry, tx, ty, sx, sy, x, y, minx, miny, maxx, maxy, toqx, toqy, torx, tory, totx, toty;

    for (i = 0; i < precision + 1; i++) {
      d = i / precision;
      px = ax + d * tobx;
      py = ay + d * toby;
      qx = bx + d * tocx;
      qy = by + d * tocy;
      rx = cx + d * todx;
      ry = cy + d * tody;
      toqx = qx - px;
      toqy = qy - py;
      torx = rx - qx;
      tory = ry - qy;
      sx = px + d * toqx;
      sy = py + d * toqy;
      tx = qx + d * torx;
      ty = qy + d * tory;
      totx = tx - sx;
      toty = ty - sy;
      x = sx + d * totx;
      y = sy + d * toty;

      if (i == 0) {
        minx = x;
        miny = y;
        maxx = x;
        maxy = y;
      } else {
        minx = Math.min(minx, x);
        miny = Math.min(miny, y);
        maxx = Math.max(maxx, x);
        maxy = Math.max(maxy, y);
      }
    }

    return new Rectangle(Math.round(minx), Math.round(miny), Math.round(maxx - minx), Math.round(maxy - miny));
  };
})(jsPDF.API);

/* global jsPDF, Deflater */

/**
 * jsPDF filters PlugIn
 * Copyright (c) 2014 Aras Abbasi
 *
 * Licensed under the MIT License.
 * https://opensource.org/licenses/mit-license
 */
(function (jsPDFAPI) {

  var ASCII85Encode = function ASCII85Encode(a) {
    var b, c, d, e, f, g, h, i, j, k; // eslint-disable-next-line no-control-regex

    for (!/[^\x00-\xFF]/.test(a), b = "\x00\x00\x00\x00".slice(a.length % 4 || 4), a += b, c = [], d = 0, e = a.length; e > d; d += 4) {
      f = (a.charCodeAt(d) << 24) + (a.charCodeAt(d + 1) << 16) + (a.charCodeAt(d + 2) << 8) + a.charCodeAt(d + 3), 0 !== f ? (k = f % 85, f = (f - k) / 85, j = f % 85, f = (f - j) / 85, i = f % 85, f = (f - i) / 85, h = f % 85, f = (f - h) / 85, g = f % 85, c.push(g + 33, h + 33, i + 33, j + 33, k + 33)) : c.push(122);
    }

    return function (a, b) {
      for (var c = b; c > 0; c--) {
        a.pop();
      }
    }(c, b.length), String.fromCharCode.apply(String, c) + "~>";
  };

  var ASCII85Decode = function ASCII85Decode(a) {
    var c,
        d,
        e,
        f,
        g,
        h = String,
        l = "length",
        w = 255,
        x = "charCodeAt",
        y = "slice",
        z = "replace";

    for ("~>" === a[y](-2), a = a[y](0, -2)[z](/\s/g, "")[z]("z", "!!!!!"), c = "uuuuu"[y](a[l] % 5 || 5), a += c, e = [], f = 0, g = a[l]; g > f; f += 5) {
      d = 52200625 * (a[x](f) - 33) + 614125 * (a[x](f + 1) - 33) + 7225 * (a[x](f + 2) - 33) + 85 * (a[x](f + 3) - 33) + (a[x](f + 4) - 33), e.push(w & d >> 24, w & d >> 16, w & d >> 8, w & d);
    }

    return function (a, b) {
      for (var c = b; c > 0; c--) {
        a.pop();
      }
    }(e, c[l]), h.fromCharCode.apply(h, e);
  };

  var ASCIIHexEncode = function ASCIIHexEncode(value) {
    return value.split("").map(function (value) {
      return ("0" + value.charCodeAt().toString(16)).slice(-2);
    }).join("") + ">";
  };

  var ASCIIHexDecode = function ASCIIHexDecode(value) {
    var regexCheckIfHex = new RegExp(/^([0-9A-Fa-f]{2})+$/);
    value = value.replace(/\s/g, "");

    if (value.indexOf(">") !== -1) {
      value = value.substr(0, value.indexOf(">"));
    }

    if (value.length % 2) {
      value += "0";
    }

    if (regexCheckIfHex.test(value) === false) {
      return "";
    }

    var result = "";

    for (var i = 0; i < value.length; i += 2) {
      result += String.fromCharCode("0x" + (value[i] + value[i + 1]));
    }

    return result;
  };
  /*
  var FlatePredictors = {
      None: 1,
      TIFF: 2,
      PNG_None: 10,
      PNG_Sub: 11,
      PNG_Up: 12,
      PNG_Average: 13,
      PNG_Paeth: 14,
      PNG_Optimum: 15
  };
  */


  var appendBuffer = function appendBuffer(buffer1, buffer2) {
    var combinedBuffer = new Uint8Array(buffer1.byteLength + buffer2.byteLength);
    combinedBuffer.set(new Uint8Array(buffer1), 0);
    combinedBuffer.set(new Uint8Array(buffer2), buffer1.byteLength);
    return combinedBuffer;
  };

  var FlateEncode = function FlateEncode(data) {
    var arr = [];
    var i = data.length;
    var adler32;
    var deflater;

    while (i--) {
      arr[i] = data.charCodeAt(i);
    }

    adler32 = jsPDFAPI.adler32cs.from(data);
    deflater = new Deflater(6);
    data = deflater.append(new Uint8Array(arr));
    data = appendBuffer(data, deflater.flush());
    arr = new Uint8Array(data.byteLength + 6);
    arr.set(new Uint8Array([120, 156]));
    arr.set(data, 2);
    arr.set(new Uint8Array([adler32 & 0xff, adler32 >> 8 & 0xff, adler32 >> 16 & 0xff, adler32 >> 24 & 0xff]), data.byteLength + 2);
    data = arr.reduce(function (data, _byte) {
      return data + String.fromCharCode(_byte);
    }, "");
    return data;
  };

  jsPDFAPI.processDataByFilters = function (origData, filterChain) {

    var i = 0;
    var data = origData || "";
    var reverseChain = [];
    filterChain = filterChain || [];

    if (typeof filterChain === "string") {
      filterChain = [filterChain];
    }

    for (i = 0; i < filterChain.length; i += 1) {
      switch (filterChain[i]) {
        case "ASCII85Decode":
        case "/ASCII85Decode":
          data = ASCII85Decode(data);
          reverseChain.push("/ASCII85Encode");
          break;

        case "ASCII85Encode":
        case "/ASCII85Encode":
          data = ASCII85Encode(data);
          reverseChain.push("/ASCII85Decode");
          break;

        case "ASCIIHexDecode":
        case "/ASCIIHexDecode":
          data = ASCIIHexDecode(data);
          reverseChain.push("/ASCIIHexEncode");
          break;

        case "ASCIIHexEncode":
        case "/ASCIIHexEncode":
          data = ASCIIHexEncode(data);
          reverseChain.push("/ASCIIHexDecode");
          break;

        case "FlateEncode":
        case "/FlateEncode":
          data = FlateEncode(data);
          reverseChain.push("/FlateDecode");
          break;

        default:
          throw new Error('The filter: "' + filterChain[i] + '" is not implemented');
      }
    }

    return {
      data: data,
      reverseChain: reverseChain.reverse().join(" ")
    };
  };
})(jsPDF.API);

/* global jsPDF */

/**
 * jsPDF fileloading PlugIn
 * Copyright (c) 2025 Aras Abbasi (aras.abbasi@gmail.com)
 *
 * Licensed under the MIT License.
 * 