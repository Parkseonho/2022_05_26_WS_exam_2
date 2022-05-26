import express from "express";
import mysql from "mysql2/promise";
import cors from "cors";

const pool = mysql.createPool({
  //DB와의 연결 정보를 입력
  host: "localhost",
  user: "sbsst",
  password: "sbs123414",
  database: "WS2",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  dateStrings: true,
});

const app = express();
app.use(cors());
app.use(express.json());
const port = 3000;

app.get("/saying/ran", async (req, res) => {
  /*  랜덤 단건 조회 */
  const [[rows]] = await pool.query(
    `
    SELECT *
    FROM w_saying
    ORDER BY 
    RAND() LIMIT 1
    `
  );

  if (rows === undefined) {
    res.status(404).json({
      resultCode: "F-1",
      msg: "404 not found",
    });
    return;
  }

  /* 조회수 증가 */

  rows.hit++;
  await pool.query(
    `
    UPDATE w_saying
    SET hit = ?
    WHERE id = ?
    
    `,
    [rows.hit, rows.id]
  );

  res.json({
    msg: "성공",
    data: rows,
  });
});

app.get("/saying/:id", async (req, res) => {
  const { id } = req.params;

  /*  랜덤 단건 조회 */
  const [[rows]] = await pool.query(
    `
    SELECT *
    FROM w_saying
    ORDER BY 
    RAND() LIMIT 1
    `
  );

  if (rows === undefined) {
    res.status(404).json({
      resultCode: "F-1",
      msg: "404 not found",
    });
    return;
  }

  /*  좋아요/싫어요 증가 */

  const {
    s_date = rows.s_date,
    content = rows.content,
    s_name = rows.s_name,
    hit = rows.hit,
    s_good = rows.s_good + 1,
    s_hate = rows.s_hate + 1,
  } = req.body;

  await pool.query(
    `
    UPDATE w_saying
    SET s_date = ?,
    content = ?,
    s_name = ?,
    hit = ?,
    s_good = ?,
    s_hate = ?,
    WHERE id = ?
    
    `,
    [s_date, content, s_name, hit, s_good, s_hate, id]
  );

  /* 좋아요/ 싫어요 수정 후 재실행분*/
  const [[Justrows]] = await pool.query(
    `
    SELECT *
    FROM w_saying
    ORDER BY 
    RAND() LIMIT 1
    `
  );

  res.json({
    msg: "성공",
    data: Justrows,
  });
});

app.listen(port, () => {
  console.log(`Wise saying app listening on port ${port}`);
});
