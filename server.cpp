#include <microhttpd.h>
#include <cstring>
#include <vector>
#include <algorithm>
#include <iostream>
#include <cmath>
#include <chrono>  
#include "calc.h"

MHD_Result handle_request(void *cls, MHD_Connection *connection, const char *url,
                          const char *method, const char *version, const char *upload_data,
                          size_t *upload_data_size, void **con_cls) {
    if (strcmp(method, "GET") != 0) {
        return MHD_NO;
    }

    if (strcmp(url, "/calculate") == 0) {
        Calculator calc;
        const int n = 1000;
        const double x = 1.0;

        std::vector<double> values;

        for (int i = 0; i < n; ++i) {
            double result = calc.FuncA(i + 1, x);
            values.push_back(result);
        }

        auto start_time = std::chrono::high_resolution_clock::now();
        std::sort(values.begin(), values.end());
        auto end_time = std::chrono::high_resolution_clock::now();

        std::chrono::duration<double> elapsed = end_time - start_time;

        std::string response = "Calculation completed. Elapsed time: " + std::to_string(elapsed.count()) + " seconds\n";

        // Використовуємо MHD_create_response_from_buffer з додатковим параметром MHD_RESPMEM_PERSISTENT
        struct MHD_Response *response_obj = MHD_create_response_from_buffer(response.size(),
            const_cast<char*>(response.c_str()), MHD_RESPMEM_PERSISTENT);  // Вказуємо, що пам'ять повинна бути збережена

        // Додаємо заголовок для текстового типу контенту
        MHD_add_response_header(response_obj, "Content-Type", "text/plain");

        int ret = MHD_queue_response(connection, MHD_HTTP_OK, response_obj);
        MHD_destroy_response(response_obj);

        return (MHD_Result)ret;
    }

    return MHD_NO;
}


int main() {
    const unsigned int PORT = 8080;

    struct MHD_Daemon *daemon;

    daemon = MHD_start_daemon(MHD_USE_THREAD_PER_CONNECTION, PORT, NULL, NULL, &handle_request, NULL, MHD_OPTION_END);
    if (daemon == NULL) {
        std::cerr << "Failed to start the HTTP server!" << std::endl;
        return 1;
    }

    std::cout << "Server is running on port " << PORT << "..." << std::endl;

    getchar();

    MHD_stop_daemon(daemon);
    return 0;
}

