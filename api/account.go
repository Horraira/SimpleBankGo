package api

import "github.com/gin-gonic/gin"

type createAccountRequest struct {
	Owner    string `json:"owner" binding:"required"`
	Currency string `json:"currency"  binding:"required, oneof=USD EUR CAD"`
}

func (server *Server) createAccount(ctx *gin.Context) {

}
