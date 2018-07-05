package function

import (
	"fmt"
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

	if res.Body != nil {
		defer res.Body.Close()
	}

	return fmt.Sprintf("URL status: %s", res.Status)
}
