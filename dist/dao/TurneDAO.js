"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.TurneDAO = void 0;
const database_1 = require("../database");
class TurneDAO {
    handleCreate(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { data, descricao } = req.body;
            const response = yield database_1.pool.query("INSERT INTO Turne (data, descricao) VALUES ($1, $2)", [data, descricao]);
            res.json({
                message: "Turne created successfully",
                turne: {
                    data,
                    descricao
                }
            });
        });
    }
    update(id, new_turne) {
        throw new Error("Method not implemented.");
    }
    delete(id) {
        throw new Error("Method not implemented.");
    }
    getTurne(id) {
        throw new Error("Method not implemented.");
    }
    getAllTurnes() {
        throw new Error("Method not implemented.");
    }
}
exports.TurneDAO = TurneDAO;
