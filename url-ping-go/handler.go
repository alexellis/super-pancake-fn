package function

import (
	"io/ioutil"
	"net/http"
)

// Handle a serverless request
func Handle(req []byte) string {
	if len(req) == 0 {
		return "Pass a URL for ping"
	}

	res, err := http.Get(string(req))
	if err != nil {
		return err.Error()
	}

	bytesOut, _ := ioutil.ReadAll(res.Body)

	return string(bytesOut)
}
