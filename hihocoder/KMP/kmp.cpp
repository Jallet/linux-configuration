#include <iostream>
#include <string>

namespace hihocoder{
namespace kmp{
class KmpWorker{
public:
	KmpWorker() {}
	KmpWorker(std::string &t, std::string &p) : text(t), pattern(p) {}
	bool init() {}
	bool set_text(std::string &new_text) {
		text = new_text;
		return true;
	}
	
	bool set_pattern(std::string &new_pattern) {
		pattern = new_pattern;
		return true;
	}

	bool get_text(std::string *result) {
		*result = text;
		return true;
	}

	bool get_pattern(std::string *result) {
		*result = pattern;
		return true;
	}

	bool count_pattern_in_text(int *result, const std::string pattern, const std::string text) {
		if (pattern.length() <= 0) {
			// do something	
			return false;
		}
		
		if (text.length() <= 0) {
			// do something	
			return false;
		}

		int *next = new int[pattern.length() + 1];

		if (!gen_next(pattern, next)) {
			// do something	
		}

		// find substring
		//
		
		*result = 0;
		int text_length = text.length();
		int pattern_length = pattern.length();
		for (int i = 0;i <= text_length - pattern_length; ++i) {
			bool status = true;
			for (int j = 0; j < pattern_length; ++j) {
				if (pattern[j] != text[i + j]) {
					// i = i + next[j] + 1;
					i = i + j - next[j];
					status = false;
					break;
				}		
			}

			if (status) {
				++(*result);
				i = i + pattern_length - next[pattern_length];
				// i = i + next[pattern_length];
			}
			
		}

		return true;
	}	
private:
	std::string text;
	std::string pattern;
	bool gen_next(const std::string &pattern, int *next) {
		next[0] = -1;
		for (int i = 0; i < pattern.length(); ++ i) {
			if (pattern[next[i]] == pattern[i]) {
				next[i + 1] = next[i] + 1;
			} 
			else{
				next[i + 1] = 0;	
			}
		}

		return true;
	}

};
}// end namespace
}// end namespace


int main() {
	std::string text;
	std::string pattern;
	hihocoder::kmp::KmpWorker kmp_worker;
	if (!kmp_worker.init()) {
		// do something	
	}	
	int num_test;
	std::cin >> num_test;
	while(num_test) {
		std::cin >> pattern;
		std::cin >> text;
		--num_test;
		
		// if (!kmp_worker.set_text(text)) {
		// 	//do something	
		// }

		// if (!kmp_worker.set_pattern(pattern)) {
		// 	// do something	
		// }

		int result = 0;

		if (!kmp_worker.count_pattern_in_text(&result, pattern , text)) {
			// do something	
		}

		std::cout << result << std::endl;
	}

	return 0;

}
