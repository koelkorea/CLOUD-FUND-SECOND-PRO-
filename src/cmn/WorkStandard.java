package cmn;

import java.util.List;

public interface WorkStandard {
	// 등록
	int doInsert(DTO param);
	
	// 삭제
	int doDelete(DTO param);
	
	// 수정
	// 성공 : flag = 1, 실패 : flag = 0
	int doUpdate(DTO param);
	
	// 단건 조회
	DTO doSelectOne(DTO param);
	
	// 목록 조회
	List<?> doRetrieve(DTO param);
}
