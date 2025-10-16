import express from "express";
import mysql from "mysql2/promise";
const pool = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "senai",
    database: "senai",
});
const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Olá Mundo");
});

app.get("/usuarios", async (req, res) => {
    const [results] = await pool.query("SELECT * FROM usuario");
    res.send(results);
});

app.get("/usuarios/:id", async (req, res) => {
    const { id } = req.params;
    const [results] = await pool.query("SELECT * FROM usuario WHERE idusuario=?", id);
    res.send(results);
});

app.post("/usuarios", async (req, res) => {
    try {
        const { body } = req;
        const [results] = await pool.query(
            "INSERT INTO usuario (nome,idade) VALUES (?,?)",
            [body.nome, body.idade]
        );

        const [usuarioCriado] = await pool.query(
            "Select * from usuario WHERE idusuario=?",
            results.insertId
        );

        return res.status(201).json(usuarioCriado);
    } catch (error) {
        console.log(error);
    }
});

app.delete("/usuarios/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const [results] = await pool.query(
            "DELETE FROM usuario WHERE idusuario=?",
            id
        );
        res.status(200).send("Usuário deletado!", results)
    } catch (error) {
        console.log(error)
    }
});

app.put("/usuarios/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { body } = req
        const [results] = await pool.query(
            "UPDATE usuario SET `nome` = ?, `idade` = ? WHERE idusuario = ?; ",
            [body.nome, body.idade, id]
        )
        res.status(200).send("Usuario atualizado", results)
    } catch (error) {
        console.log(error)
    }
})

//Registro

app.post("/registro", async (req, res) => {
    try {
        const { body } = req;
        const [results] = await pool.query(
            "INSERT INTO usuario (nome,idade,email,senha) VALUES (?,?,?,?)",
            [body.nome, body.idade, body.email, body.senha]
        );

        const [usuarioCriado] = await pool.query(
            "Select * from usuario WHERE idusuario=?",
            results.insertId
        );

        return res.status(201).json(usuarioCriado);
    } catch (error) {
        console.log(error);
    }
});

//Login

app.post("/login", async (req, res) => {
    try {
        const { body } = req;
        const [results] = await pool.query(
            "SELECT * FROM usuario WHERE usuario.senha = ? AND usuario.email = ?",
            [body.senha, body.email]
        );
        if (results.length > 0) res.status(200).json(`Usuario ${results[0].nome} logado com sucesso`)
        else res.status(404).json("Usuario não encontrado")

    } catch (error) {
        console.error(error);
    }
});


app.post("/usuarios", async (req, res) => {
    try {
        const { body } = req;
        const [results] = await pool.query(
            "INSERT INTO usuario (nome,idade) VALUES (?,?)",
            [body.nome, body.idade]
        );

        const [usuarioCriado] = await pool.query(
            "Select * from usuario WHERE idusuario=?",
            results.insertId
        );

        return res.status(201).json(usuarioCriado);
    } catch (error) {
        console.log(error);
    }
});

//Logs

app.post("/logs", async (req, res) => {
    try {
        const { body } = req;
        const [results] = await pool.query(
            "INSERT INTO lgs(categoria,horas_trabalhadas,linha_de_codigo,bugs_corrigidos) VALUES(?,?,?,?)",
            [body.categotia, body.horas_trabalhadas, body.linha_de_codigo, body.bugs_corrigidos]
        )

        const [logCriado] = await pool.query(
            "Select * from lgs WHERE id_log=?",
            results.insertId
        );

        return res.status(201).json(logCriado);
    } catch (error) {
        console.log(error);
    }
})

app.get("/logs", async (req, res) => {
    try {
        const {query} = req;
        const pagina = Number(query.pagina) - 1
        const quantidade = Number(query.quantidade)
        const offset = pagina * quantidade


        const [results] = await pool.query("SELECT * FROM lgs LIMIT ? OFFSET ?", [quantidade, offset]);
        res.send(results);

    } catch (error) {
        console.log(error)
    }

})

 app.get ("/logs/categoria",async (req, res) => {
    try {
        const [results] = await pool.query("SELECT DISTINCT(categoria) FROM lgs" );
        res.send(results);

    } catch (error) {
        console.log(error)
    }
 })

app.listen(3000, () => {
    console.log(`Servidor rodando na porta: 3000`);
});