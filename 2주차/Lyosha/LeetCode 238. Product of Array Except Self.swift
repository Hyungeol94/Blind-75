class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixes: [Int] = []
        var suffixes: [Int] = []
        let n = nums.count
        var prev = 1
        for i in 0...n-1 {
            var curr = prev*nums[i]
            prefixes.append(curr)
            prev = curr
        }
        
        prev = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            var curr = prev*nums[i]
            suffixes.insert(curr, at:0)
            prev = curr
        }
        
        var ans: [Int] = [suffixes[1]]
        if 3 <= n {
            for i in 1...n-2 {
                var product = prefixes[i-1]*suffixes[i+1]
                ans.append(product)
            }
        }
        ans.append(prefixes[n-2])
        
        return ans
    }
}