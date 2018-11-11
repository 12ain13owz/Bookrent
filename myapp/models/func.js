const fs = require('fs')
const xl = require('excel4node')
const bcrypt = require('bcryptjs')
const mysql = require('mysql')
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_bookrent',
    debug: false
})

const formatDate = (date, separate) => {
    let d = new Date(date),
        year = d.getFullYear(),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate()

    if (month.length < 2) month = '0' + month
    if (day.length < 2) day = '0' + day

    return [year, month, day].join(separate)
}

module.exports = {
    login: (req, res, next) => {
        if (req.session.user_id == undefined) next()
        else res.redirect('/index')
    },
    conn: (req, res, next) => {
        if (req.session.user_data == undefined) res.redirect('/')
        else next()
    },
    auth: (req, res, next) => {
        let post = req.body
        let sql = 'SELECT * FROM tb_account USE INDEX (account01) WHERE username = ?'

        try {
            db.query(sql, [post.username], (err, rows) => {
                if (err) console.log(err)
                if (rows.length == 0) {
                    req.stat = 400
                    req.msg = 'Error: Username หรือ Password ไม่ถูกต้อง'
                    next()
                } else {
                    bcrypt.compare(post.password, rows[0].password, (err, result) => {
                        if (result) {
                            req.stat = 200
                            req.msg = 'Success: กำลังเข้าสู่ระบบ กรุณารอซักครู่'

                            if (post.remember != undefined) req.session.user_id = rows[0].id
                            req.session.user_data = {
                                id: rows[0].id,
                                username: rows[0].username,
                            }
                        } else {
                            req.stat = 400
                            req.msg = 'Error: Username หรือ Password ไม่ถูกต้อง'
                        }
                        next()
                    })
                }
            })
        } catch (err) { console.log(err) }
    },
    genlistbook: (callback) => {
        let sql = 'SELECT namebook FROM tb_listbook'
        db.query(sql, (err, rows) => {
            let json = JSON.stringify(rows)
            json = json.replace(new RegExp('namebook', 'g'), 'name')
            fs.writeFile('public/jsons/searchbook.json', json, 'utf8')
            callback(null, null)
        })
    },
    index: (callback) => {
        try {
            let sql = 'SELECT namebook, vol, pathimg FROM tb_volbook ORDER BY entdate DESC LIMIT 8'
            db.query(sql, (err, newst) => {
                if (err) callback(err, null)
                else {
                    sql = 'SELECT namebook, vol, pathimg FROM tb_volbook ORDER BY rentcount DESC LIMIT 8'
                    db.query(sql, (err, popst) => {
                        if (err) callback(err, null)
                        else {
                            let data = {
                                newst: newst,
                                popst: popst
                            }
                            callback(null, data)
                        }
                    })
                }
            })
        } catch (err) { callback(err, null) }
    },
    regis: (post, callback) => {
        try {
            let sql = 'SELECT idcard FROM tb_customer USE INDEX (customer01) WHERE idcard = ?'

            db.query(sql, [post.idcard], (err, rows) => {
                if (err) callback(err, null)

                if (rows.length > 0) callback('รหัสบัตรประชาชนซ้ำ กรุณาตรวจสอบ', null)
                else {
                    sql = 'INSERT INTO tb_customer SET ?'
                    db.query(sql, [post], (err, rows) => {
                        if (err) console.log(err)
                        callback(null, 'ลงทะเบียนสำเร็จ')
                    })
                }
            })
        } catch (err) { callback(err, null) }
    },
    editcus: (post, callback) => {
        try {
            let sql = 'SELECT id FROM tb_customer WHERE idcard = ?'

            db.query(sql, [post.idcard], (err, rows) => {
                if (err) callback(err, null)

                if (rows.length > 0) callback('รหัสบัตรประชาชนซ้ำ กรุณาตรวจสอบ', null)
                else {
                    sql = 'UPDATE tb_customer USE INDEX (customer01) SET ? WHERE id = ?'
                    db.query(sql, [post, post.id], (err, rows) => {
                        if (err) callback(err, null)
                        else callback(null, 'แก้ไขข้อมูลสำเร็จ')
                    })

                }
            })
        } catch (err) { callback(err, null) }
    },
    listcus: (callback) => {
        try {
            let sql = 'SELECT id, fullname, idcard FROM tb_customer'
            db.query(sql, (err, rows) => {
                if (err) callback(err, null)
                else {
                    let data = []
                    for (let i = 0; i < rows.length; i++) {
                        data.push({ name: rows[i].id + ' - ' + rows[i].fullname + ' - ' + rows[i].idcard })
                    }
                    callback(null, data)
                }
            })
        } catch (err) { callback(err, null) }
    },
    searchcus: (post, callback) => {
        try {
            let cus = post.searchcus.split('-')
            let sql = 'SELECT * FROM tb_customer WHERE id = ? OR fullname = ? OR idcard = ?'

            if (cus.length == 1) {
                if (cus[0].length == 4) cus = [cus[0], '', '']
                else if (cus[0].length == 13) cus = ['', '', cus[0]]
                else cus = ['', cus[0], '']
            }

            db.query(sql, [cus[0], cus[1], cus[2]], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length <= 0) callback('ไม่พบข้อมูลในระบบ กรุณาตรวจสอบ', null)
                    else {
                        rows[0].birthday = formatDate(rows[0].birthday, '-')
                        callback(null, rows[0])
                    }
                }
            })
        } catch (err) { callback(err, null) }
    },
    regisacc: (post, callback) => {
        try {
            let sql = 'SELECT id FROM tb_account USE INDEX (account01) WHERE username = ?'
            db.query(sql, [post.username], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length > 0) callback('ไม่สามารถลงทะเบียนได้ เนื่องจาก Username ซ้ำ')
                    else {
                        let salt = bcrypt.genSaltSync(10)
                        let hash = bcrypt.hashSync(post.password, salt)
                        let data = {
                            username: post.username,
                            password: hash
                        }

                        sql = 'INSERT INTO tb_account SET ?'
                        db.query(sql, [data], (err, rows) => {
                            if (err) callback(err, null)
                            else callback(null, 'ลงทะเบียนสำเร็จ')
                        })
                    }
                }
            })
        } catch (err) { callback(err, null) }
    },
    changepass: (post, callback) => {
        try {
            let sql = 'SELECT id FROM tb_account WHERE id = ?'
            db.query(sql, [post.id], (err, rows) => {
                if (rows.length <= 0) callback('ไม่พบข้อมูลในระบบ กรุณาตรวจสอบ')
                else {
                    let salt = bcrypt.genSaltSync(10)
                    let hash = bcrypt.hashSync(post.newpass, salt)

                    sql = 'UPDATE tb_account SET password = ? WHERE id = ?'
                    db.query(sql, [hash, post.id], (err, rows) => {
                        if (err) callback(err, null)
                        else callback(null, 'เปลี่ยนรหัสสำเร็จ')
                    })
                }
            })
        } catch (err) { callback(err, null) }
    },
    addimg: (post, file, callback) => {
        if (file) {
            let dir = 'public/images/' + post.id + '/'
            let exten = file.image.name.substr(file.image.name.lastIndexOf('.'))
            let pathimg = dir + post.id + '-' + post.vol + exten
            if (!fs.existsSync(dir)) fs.mkdirSync(dir)

            fs.readdir(dir, (err, files) => {
                if (err) callback(err, null)
                else {
                    file.image.mv(pathimg, (err) => {
                        callback(err, pathimg)
                    })
                }
            })
        } else callback(null, 'public/images/no-image.png')
    },
    rentbook: (post, callback) => {
        let json = JSON.parse(post.rent)
        let tmr = new Date()
        let ledate = formatDate(tmr, '-')
        let redate = formatDate(tmr.setDate(tmr.getDate() + 1), '-')
        let id = json[0].id

        for (let i = 0; i < json.length; i++) {
            let data = {
                id: json[i].id,
                fullname: json[i].fullname,
                namebook: json[i].namebook,
                vol: json[i].vol,
                lend: json[i].lend,
                ledate: ledate,
                redate: redate,
                status: 'Y'
            }

            let sql = 'SELECT id FROM tb_bookrent WHERE id = ? AND namebook = ? AND vol = ? AND status = "Y"'
            db.query(sql, [data.id, data.namebook, data.vol, data.status], (err, rows) => {
                if (rows.length > 0) {
                    if ((i + 1) == json.length) callback(null, 'Success! บันทึกข้อมูลสำเร็จ')
                    return
                } else {
                    sql = 'INSERT INTO tb_bookrent SET ?'
                    db.query(sql, [data], (err, result) => {
                        data = {
                            stock: json[i].stock,
                            rentcount: json[i].rentcount
                        }

                        sql = 'UPDATE tb_volbook SET ? WHERE namebook = ? AND vol = ?'
                        db.query(sql, [data, json[i].namebook, json[i].vol], (err, rows) => {
                            sql = 'SELECT rentcount FROM tb_listbook WHERE namebook = ?'
                            db.query(sql, json[i].namebook, (err, rows2) => {
                                let rentcount = rows2[0].rentcount + 1
                                sql = 'UPDATE tb_listbook SET rentcount = ? WHERE namebook = ?'

                                db.query(sql, [rentcount, json[i].namebook], (err, rows3) => {
                                    if ((i + 1) == json.length) callback(null, 'Success! บันทึกข้อมูลสำเร็จ', id)
                                    return
                                })
                            })
                        })
                    })
                }
            })
        }
    },
    rebook: (post, callback) => {
        try {
            let json = JSON.parse(post.ret)

            for (let i = 0; i < json.length; i++) {
                let sql = 'SELECT id FROM tb_bookrent WHERE id = ? AND namebook = ? AND vol = ? AND status = "Y"'
                db.query(sql, [json[i].id, json[i].namebook, json[i].vol], (err, rows) => {
                    if (rows <= 0) return
                    else {
                        let data = {
                            id: json[i].id,
                            namebook: json[i].namebook,
                            vol: json[i].vol,
                            status: 'N'
                        }
                        sql = 'UPDATE tb_bookrent SET ? WHERE id = ? AND namebook = ? AND vol = ? AND status = "Y"'
                        db.query(sql, [data, json[i].id, json[i].namebook, json[i].vol], (err, result) => {
                            if (err) return
                            else {
                                sql = 'SELECT stock FROM tb_volbook WHERE namebook = ? AND vol = ?'
                                db.query(sql, [json[i].namebook, json[i].vol], (err, stock) => {
                                    if (err) return
                                    stock[0].stock = stock[0].stock + 1

                                    sql = 'UPDATE tb_volbook SET stock = ? WHERE namebook = ? AND vol = ?'
                                    db.query(sql, [stock[0].stock, json[i].namebook, json[i].vol], (err, que) => {
                                        if ((i + 1) == json.length) callback(null, 'Success! บันทึกข้อมูลสำเร็จ')
                                        return
                                    })
                                })
                            }
                        })
                    }
                })
            }

        } catch (err) { callback(err, null) }
    },
    listrentbook: (id, callback) => {
        try {
            let sql = 'SELECT * FROM tb_bookrent WHERE id = ? AND status = "Y"'
            db.query(sql, [id], (err, rows) => {
                if (err) callback(err, null)
                else callback(null, rows)
            })
        } catch (err) { callback(err, null) }
    },
    addbook: (post, pathimg, callback) => {
        try {
            let sql = 'SELECT id FROM tb_volbook WHERE id = ? AND vol = ?'
            db.query(sql, [post.id, post.vol], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length > 0) callback('เพิ่มหนังสือซ้ำ กรุณาตรวจสอบข้อมูล', null)
                    else {
                        post.pathimg = pathimg.substr(pathimg.indexOf('/') + 1)
                        sql = 'INSERT INTO tb_volbook SET ?'
                        db.query(sql, [post], (err, rows) => {
                            if (err) callback(err, null)
                            else callback(err, post)
                        })
                    }
                }
            })
        } catch (err) { callback(err, null) }
    },
    listpublisher: (publisher) => {
        fs.readFile('public/jsons/publisher.json', 'utf8', (err, rows) => {
            if (err) console.log(err)
            let data

            if (!rows) {
                data = [{ name: publisher }]
                fs.writeFile('public/jsons/publisher.json', JSON.stringify(data), 'utf8')
            } else {
                data = JSON.parse(rows)
                for (let i = 0; i < data.length; i++) {
                    if (data[i].name == publisher) break
                    else {
                        if (i == (data.length - 1)) {
                            data.push({ name: publisher })
                            fs.writeFile('public/jsons/publisher.json', JSON.stringify(data), 'utf8')
                        }
                    }
                }
            }
        })
    },
    listbook: (post, callback) => {
        try {
            let sql = 'SELECT namebook FROM tb_listbook USE INDEX (listbook01) WHERE namebook = ?'
            db.query(sql, [post.namebook], (err, rows) => {
                if (err) console.log(err)

                if (rows.length > 0) callback('ชื่อหนังสือซ้ำ กรุณาตรวจสอบ', null)
                else {
                    sql = 'INSERT INTO tb_listbook SET ?'
                    db.query(sql, [post], (err, rows) => {
                        fs.readFile('public/jsons/searchbook.json', 'utf8', (err, rows) => {
                            if (err) console.log(err)
                            let data

                            if (!rows) data = [{ name: post.namebook }]
                            else {
                                data = JSON.parse(rows)
                                data.push({ name: post.namebook })
                            }
                            fs.writeFile('public/jsons/searchbook.json', JSON.stringify(data), 'utf8')
                        })
                        callback(err, 'เพิ่มหนังสือ ' + post.namebook + ' สำเร็จ')
                    })
                }
            })
        } catch (err) { callback(err, null) }
    },
    searchbook: (namebook, callback) => {
        try {
            let sql = 'SELECT * FROM tb_listbook USE INDEX (listbook01) WHERE namebook = ?'
            db.query(sql, [namebook], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length <= 0) callback('ไม่พบข้อมูลที่ท่านค้นหา กรุณาตรวจสอบ', null)
                    else {
                        sql = "SELECT vol, pathimg FROM tb_volbook WHERE id = ? ORDER BY vol DESC LIMIT 1"
                        db.query(sql, [rows[0].id], (err, result) => {
                            if (err) console.log(err)


                            if (result.length <= 0) {
                                rows[0].vol = 'ไม่มีข้อมูลในระบบ'
                                rows[0].pathimg = '/images/no-image.png'
                            } else {
                                rows[0].vol = result[0].vol
                                rows[0].pathimg = result[0].pathimg
                            }
                            callback(null, rows[0])
                        })
                    }
                }
            })
        } catch (err) { callback(err), null }
    },
    searchallbook: (namebook, callback) => {
        try {
            let sql = 'SELECT * FROM tb_listbook USE INDEX (listbook01) WHERE namebook = ?'
            db.query(sql, [namebook], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length <= 0) callback('ไม่พบข้อมูลที่ท่านค้นหา กรุณาตรวจสอบ', null)
                    else {
                        sql = "SELECT * FROM tb_volbook WHERE id = ? ORDER BY vol ASC"
                        db.query(sql, [rows[0].id], (err, result) => {
                            if (err) callback(err, null)
                            else {
                                if (result.length <= 0) {
                                    rows[0].vol = 'ไม่มีข้อมูลในระบบ'
                                    rows[0].pathimg = '/images/no-image.png'
                                } else {
                                    let max = result.length - 1
                                    rows[0].vol = result[max].vol
                                    rows[0].pathimg = result[max].pathimg
                                }
                                callback(null, rows[0], result)
                            }
                        })
                    }
                }
            })
        } catch (err) { callback(err), null }
    },
    editlistbook: (post, callback) => {
        try {
            console.log(post)
            let sql = 'SELECT id FROM tb_listbook WHERE id = ?'
            db.query(sql, [post.id], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length <= 0) callback('ไม่พบข้อมูลในระบบ กรุณาตรวจสอบ', null)
                    else {
                        sql = 'UPDATE tb_listbook SET ? WHERE id = ?'
                        db.query(sql, [post, post.id], (err, result) => {
                            if (err) callback(err, null)
                            else {
                                sql = 'UPDATE tb_volbook SET namebook = ? WHERE id = ?'
                                db.query(sql, [post.namebook, post.id], (err, data) => {
                                    callback(err, 'แก้ไขหนังสือ ' + post.namebook + ' สำเร็จ')
                                })
                            }
                        })
                    }
                }
            })
        } catch (err) { callback(err), null }
    },
    searchvolbook: (post, callback) => {
        try {
            let sql = 'SELECT * FROM tb_volbook WHERE id = ? AND vol = ?'
            db.query(sql, [post.id, post.vol], (err, rows) => {
                if (err) callback(err, null)
                else callback(null, rows[0])
            })

        } catch (err) { callback(err), null }
    },
    editvollbook: (post, pathimg, callback) => {
        try {
            let sql = 'SELECT id FROM tb_volbook WHERE id = ? AND vol = ?'
            db.query(sql, [post.id, post.vol], (err, rows) => {
                if (err) callback(err, null)
                else {
                    if (rows.length <= 0) callback('ไม่พบข้อมูลในระบบ กรุณาตรวจสอบ', null)
                    else {
                        post.pathimg = pathimg.substr(pathimg.indexOf('/') + 1)
                        console.log(post)
                        sql = 'UPDATE tb_volbook SET ? WHERE id = ? AND vol = ?'
                        db.query(sql, [post, post.id, post.vol], (err, rows) => {
                            if (err) callback(err, null)
                            else callback(err, post)
                        })
                    }
                }
            })
        } catch (err) { callback(err, null) }
    },
    cate: (post, callback) => {
        if (post.search == undefined) callback(null, [])
        else {
            let search = post.search
            let sql

            if (search == 0) sql = 'SELECT * FROM tb_listbook WHERE SUBSTR(namebook, 1, 1)  REGEXP "[0-9]"'
            else if (search == 'th') sql = 'SELECT * FROM tb_listbook WHERE SUBSTR(namebook, 1, 1)  REGEXP "[ก-ฮ]"'
            else if (search == 'not') sql = 'SELECT * FROM tb_listbook WHERE status = "ยังไม่จบ"'
            else if (search == 'end') sql = 'SELECT * FROM tb_listbook WHERE status = "จบแล้ว"'
            else if (search == 'new') sql = 'SELECT * FROM tb_listbook ORDER BY entdate DESC'
            else if (search == 'best') sql = 'SELECT * FROM tb_listbook ORDER BY rentcount DESC'
            else {
                sql = 'SELECT * FROM tb_listbook WHERE namebook LIKE ?'
                search = search + '%'
            }

            db.query(sql, [search], (err, rows) => {
                if (err) callback(err, [])
                else if (rows.length == 0) callback(null, [])
                else {
                    for (let i = 0; i < rows.length; i++) {
                        sql = 'SELECT pathimg FROM tb_volbook WHERE id = ? ORDER BY entdate DESC LIMIT 1'
                        db.query(sql, [rows[i].id], (err, result) => {
                            rows[i].pathimg = result[0].pathimg
                            if ((i + 1) == rows.length) callback(null, rows)
                        })
                    }
                }
            })
        }
    },
    report: (month, callback) => {
        let sql = 'SELECT * FROM tb_bookrent WHERE DATE(entdate) = CURDATE()'
        let data = []

        if (month == undefined) {
            month = new Date()
            month = month.getMonth() + 1
        }

        db.query(sql, (err, rows) => {
            if (err) callback(err, null)
            else {
                data.rentday = rows
                sql = 'SELECT * FROM tb_customer WHERE DATE(regisdate) = CURDATE()'

                db.query(sql, (err, rows) => {
                    data.regisday = rows
                    sql = 'SELECT * FROM tb_bookrent WHERE MONTH(entdate) = ?'

                    db.query(sql, [month], (err, rows) => {
                        data.rentmonth = rows
                        sql = 'SELECT * FROM tb_customer WHERE MONTH(regisdate) = ?'

                        db.query(sql, [month], (err, rows) => {
                            data.regismonth = rows

                            if (data.rentday == undefined) data.rentday = []
                            if (data.regisday == undefined) data.regisday = []
                            if (data.rentmonth == undefined) data.rentmonth = []
                            if (data.regismonth == undefined) data.regismonth = []
                            callback(null, data)
                        })
                    })
                })
            }
        })
    },
    excel: (post, callback) => {
        let dir = 'public/download/'
        let sql = 'SELECT * FROM tb_bookrent WHERE (DATE(entdate) BETWEEN ? AND ?)'
        let from = formatDate(post.from, '-')
        let to = formatDate(post.to, '-')
        let url = dir + from + '_' + to + '.xlsx'
        let path = '/download/' + from + '_' + to + '.xlsx'
        let wb = new xl.Workbook({
            defaultFont: {
                size: 11,
                name: 'Calibri'
            }
        })

        let ws = wb.addWorksheet('เช่าหนังสือ')
        ws.cell(1, 1).string('ลำดับ')
        ws.cell(1, 2).string('ชื่อหนังสือ')
        ws.cell(1, 3).string('ผู้เช่า')
        ws.cell(1, 4).string('ค่าเช่า')
        ws.cell(1, 5).string('วันที่เช่า')
        ws.cell(1, 6).string('วันที่คืน')
        ws.cell(1, 7).string('สถานะ')

        db.query(sql, [from, to], (err, rows) => {
            if (err) console.log(err)
            let total = 0,
                status

            for (let i = 0; i < rows.length; i++) {
                ws.cell(2 + i, 1).number(i + 1)
                ws.cell(2 + i, 2).string(rows[i].namebook + ' ' + rows[i].vol)
                ws.cell(2 + i, 3).string(rows[i].fullname)
                ws.cell(2 + i, 4).number(rows[i].lend)
                ws.cell(2 + i, 5).date(rows[i].ledate)
                ws.cell(2 + i, 6).date(rows[i].redate)
                total += rows[i].lend

                if (rows[i].status == 'Y') status = 'ยืม'
                else status = 'คืน'

                ws.cell(2 + i, 7).string(status)
            }
            ws.cell(rows.length + 2, 3).string('Total :').style({ alignment: { horizontal: 'right' } })
            ws.cell(rows.length + 2, 4).number(total)

            ws = wb.addWorksheet('ผู้สมัครสมาชิก')
            ws.cell(1, 1).string('ลำดับ')
            ws.cell(1, 2).string('ชื่อผู้สมัคร')
            ws.cell(1, 3).string('รหัสบัตรประชาชน')
            ws.cell(1, 4).string('เบอร์โทรศัพท์')
            ws.cell(1, 5).string('เพศ')
            ws.cell(1, 6).string('E-mail')


            sql = 'SELECT * FROM tb_customer WHERE (DATE(regisdate) BETWEEN ? AND ?)'
            db.query(sql, [from, to], (err, rows) => {
                if (err) console.log(err)

                for (let i = 0; i < rows.length; i++) {
                    ws.cell(2 + i, 1).number(i + 1)
                    ws.cell(2 + i, 2).string(rows[i].fullname)
                    ws.cell(2 + i, 3).string('' + rows[i].idcard)
                    ws.cell(2 + i, 4).string('' + rows[i].mobiletel)
                    ws.cell(2 + i, 5).string(rows[i].sex)
                    ws.cell(2 + i, 6).string(rows[i].email)
                }

                wb.write(url, (err, stats) => {
                    if (err) {
                        console.log(err)
                        res.status(400).send({ msg: 'Error! Excel is Working On' })
                    } else callback(null, path)
                })
            })
        })
    }
}