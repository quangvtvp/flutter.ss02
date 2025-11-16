#include <iostream>
#include <vector>
#include <stack>
using namespace std;

int largestRectangleArea(vector<int>& heights) {
    stack<int> st;
    heights.push_back(0); // sentinel
    int max_area = 0;
    for (int i = 0; i < (int)heights.size(); i++) {
        while (!st.empty() && heights[st.top()] > heights[i]) {
            int h = heights[st.top()];
            st.pop();
            int width = st.empty() ? i : i - st.top() - 1;
            max_area = max(max_area, h * width);
        }
        st.push(i);
    }
    heights.pop_back();
    return max_area;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int M, N;
    cin >> M >> N;
    vector<vector<int>> matrix(M, vector<int>(N));

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            cin >> matrix[i][j];
        }
    }

    vector<int> heights(N, 0);
    int max_area = 0;

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            if (matrix[i][j] == 1) heights[j] += 1;
            else heights[j] = 0;
        }
        max_area = max(max_area, largestRectangleArea(heights));
    }

    cout << max_area << "\n";
    return 0;
}
