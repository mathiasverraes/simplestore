module Domain.Authorization where

import Domain.Models(TenantId,ProjectId)
import Domain.Authentication(IdentityId)

data TenantSpec = AllTenants | SpecificTenant TenantId deriving (Eq,Show,Read)
data TenantRole = TenantAdmin deriving (Eq,Show,Read)

data ProjectSpec = AllProjects | AllTenantProjects TenantId | OwnTenantProjects TenantId | SpecificProject ProjectId deriving (Eq,Show,Read)
data ProjectRole = ProjectEditor | ProjectReviewer deriving (Eq,Show,Read)

data Claim = TenantClaim TenantRole TenantSpec
          | ProjectClaim  ProjectRole ProjectSpec
          | IdentityClaim IdentityId
          | SuperAdmin
          deriving (Eq,Show,Read)
