Date Utilities for JavaScript
===============================
A small library that provides basic utilites for parsing and formatting dates

Usage
----------
* Pretty date:

    ```javascript
        date = Date.now()
        pretty = DateUtils.prettify(date)
        console.log(pretty) // just now

        date = new Date(2013-03-03)
        pretty = DateUtils.prettify(date)
        console.log(pretty) // about one year and two months ago

        // with a specific locale
        pretty = DateUtils.prettify(date, { locale: 'ar' })
        console.log(pretty) // منذ حوالي سنة وشهرين
    ```

* Date parsing:

    ```javascript
        date = Date.now()
        parsed = DateUtils.parse(date)
        console.log(parsed) // [[0, 's']]

        date = new Date(2013-03-03)
        parsed = DateUtils.parse(date)
        console.log(parsed) // [[1, 'year'], [2, 'month']]
    ```


Install
---------

Using npm

```bash
npm install date-utils
```

Using bower

```bash
npm install forabi/date-utils
```